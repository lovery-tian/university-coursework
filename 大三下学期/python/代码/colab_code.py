# -*- coding: utf-8 -*-
"""
=====================================================================
Modulation Recognition Based on Higher-Order Cumulants and Random Forest
Complete Code for Google Colab — IEEE Transactions on Communications Style
=====================================================================
Instructions:
  1. Open Google Colab (https://colab.research.google.com)
  2. Create a new notebook
  3. Paste ALL code below into a single cell
  4. Click ▶️ or press Ctrl+Shift+Enter
  5. Download generated PNG files from the left sidebar (Files panel)
=====================================================================
"""

# ===================== 0. Environment Setup =====================
# For Google Colab: enable inline plotting
try:
    from IPython import get_ipython
    get_ipython().run_line_magic('matplotlib', 'inline')
except Exception:
    pass

import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split, GridSearchCV, learning_curve, StratifiedKFold
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.preprocessing import StandardScaler, label_binarize
from sklearn.metrics import (classification_report, confusion_matrix,
                             roc_curve, auc, accuracy_score)
import time
import warnings
warnings.filterwarnings('ignore')

# Try to set Chinese font for Colab
try:
    import matplotlib.font_manager as fm
    import subprocess
    subprocess.run(['apt-get', 'install', '-y', 'fonts-wqy-zenhei'],
                   capture_output=True, timeout=30)
    fm._load_fontmanager(try_read_cache=False)
    plt.rcParams['font.sans-serif'] = ['WenQuanYi Zen Hei', 'SimHei', 'DejaVu Sans']
except Exception:
    plt.rcParams['font.sans-serif'] = ['DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False

np.random.seed(42)
print("=" * 65)
print("  Modulation Recognition: Higher-Order Cumulants + Random Forest")
print("=" * 65)

# ===================== 1. Theoretical Cumulant Table =====================
modulations = ['BPSK', 'QPSK', '8PSK', '16QAM']
feature_names = ['C20', 'C21', 'C40', 'C41', 'C42', 'C60', 'C63']

# Theoretical cumulant values (normalized, from Swami & Sadler 2000)
theoretical = {
    'BPSK':  [1.0,   1.0,  -2.0,  -2.0,  -2.0,   0.0,   0.0],
    'QPSK':  [0.0,   1.0,  -1.0,  -1.0,  -1.0,   0.0,   0.0],
    '8PSK':  [0.0,   1.0,   0.0,   0.0,  -1.0,   0.0,   0.0],
    '16QAM': [0.0,   1.0,  -0.68, -0.68, -0.68,   0.0,   0.0],
}

print("\n[Table I] Theoretical Cumulant Values")
print("-" * 75)
header = f"{'Modulation':<12}" + "".join(f"{f:>8}" for f in feature_names)
print(header)
print("-" * 75)
for mod in modulations:
    row = f"{mod:<12}" + "".join(f"{v:>8.2f}" for v in theoretical[mod])
    print(row)
print("-" * 75)

# ===================== 2. Data Generation =====================
n_samples_per_class = 500
n_classes = len(modulations)

# Covariance models noise variance on cumulant estimates
# At high SNR, cumulant estimation variance is small
cov_high_snr = np.diag([0.05, 0.02, 0.10, 0.10, 0.10, 0.03, 0.03])

X_list, y_list = [], []
for idx, mod in enumerate(modulations):
    mean_vec = np.array(theoretical[mod])
    features = np.random.multivariate_normal(mean_vec, cov_high_snr, n_samples_per_class)
    X_list.append(features)
    y_list.extend([idx] * n_samples_per_class)

X_raw = np.vstack(X_list)
y = np.array(y_list)

df = pd.DataFrame(X_raw, columns=feature_names)
df['Label'] = [modulations[i] for i in y]

print(f"\n[Dataset] Total samples: {len(df)}, Features: {len(feature_names)}, Classes: {n_classes}")
print(f"[Dataset] Samples per class: {n_samples_per_class}")
print(f"[Dataset] Train/Test split: 70% / 30% (stratified)")

# ===================== 3. Preprocessing =====================
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X_raw)

X_train, X_test, y_train, y_test = train_test_split(
    X_scaled, y, test_size=0.3, random_state=42, stratify=y
)
print(f"[Split] Training: {len(X_train)}, Test: {len(X_test)}")

# ===================== 4. Feature Distribution Plot =====================
fig, axes = plt.subplots(2, 4, figsize=(16, 8))
axes = axes.flatten()
for i, feat in enumerate(feature_names):
    ax = axes[i]
    for mod in modulations:
        mask = df['Label'] == mod
        ax.hist(df.loc[mask, feat], bins=30, alpha=0.5, density=True, label=mod)
    ax.set_title(f'{feat}', fontsize=12)
    ax.set_xlabel(feat, fontsize=10)
    ax.set_ylabel('Density', fontsize=10)
    ax.legend(fontsize=8)
    ax.grid(alpha=0.3)
axes[-1].axis('off')
plt.suptitle('Fig. 1. Probability Density of HOC Features by Modulation Type', fontsize=14)
plt.tight_layout(rect=[0, 0, 1, 0.95])
plt.savefig('fig1_feature_distribution.png', dpi=200, bbox_inches='tight')
plt.show()
plt.close()
print("\n[Saved] fig1_feature_distribution.png")

# ===================== 5. Constellation Diagrams =====================
fig, axes = plt.subplots(2, 2, figsize=(10, 10))
constellation_params = {
    'BPSK':  {'points': [(-1, 0), (1, 0)], 'sigma': 0.15},
    'QPSK':  {'points': [(-1,-1),(-1,1),(1,-1),(1,1)], 'sigma': 0.15},
    '8PSK':  {'points': [(np.cos(k*np.pi/4), np.sin(k*np.pi/4)) for k in range(8)], 'sigma': 0.12},
    '16QAM': {'points': [(i, q) for i in [-3,-1,1,3] for q in [-3,-1,1,3]], 'sigma': 0.25},
}
for idx, mod in enumerate(modulations):
    ax = axes[idx // 2][idx % 2]
    pts = np.array(constellation_params[mod]['points'])
    sig = constellation_params[mod]['sigma']
    n_pts = 200
    chosen = pts[np.random.randint(0, len(pts), n_pts)]
    i_sigs = np.array([c[0] for c in chosen]) + np.random.normal(0, sig, n_pts)
    q_sigs = np.array([c[1] for c in chosen]) + np.random.normal(0, sig, n_pts)
    ax.scatter(i_sigs, q_sigs, s=8, alpha=0.6, c='steelblue')
    for p in pts:
        ax.plot(p[0], p[1], 'r+', markersize=12, markeredgewidth=2)
    ax.set_title(f'{mod} Constellation (SNR ≈ 20 dB)', fontsize=12)
    ax.set_xlabel('In-phase (I)', fontsize=10)
    ax.set_ylabel('Quadrature (Q)', fontsize=10)
    ax.set_aspect('equal')
    ax.grid(alpha=0.3)
    lim = max(max(abs(np.array([c[0] for c in pts]))), max(abs(np.array([c[1] for c in pts])))) + 1
    ax.set_xlim(-lim, lim)
    ax.set_ylim(-lim, lim)
plt.suptitle('Fig. 2. Simulated Constellation Diagrams with AWGN', fontsize=14)
plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.savefig('fig2_constellation.png', dpi=200, bbox_inches='tight')
plt.show()
plt.close()
print("[Saved] fig2_constellation.png")

# ===================== 6. Random Forest + GridSearchCV =====================
print("\n" + "=" * 65)
print("  Model Training: Random Forest with 5-Fold Cross-Validation")
print("=" * 65)

param_grid = {
    'n_estimators': [50, 100, 200],
    'max_depth': [5, 10, 20, None],
    'min_samples_split': [2, 5, 10],
}

rf = RandomForestClassifier(random_state=42, n_jobs=-1)
cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)
grid_search = GridSearchCV(rf, param_grid, cv=cv, scoring='accuracy', n_jobs=-1, verbose=0)
grid_search.fit(X_train, y_train)

best_rf = grid_search.best_estimator_
y_pred = best_rf.predict(X_test)
test_acc = accuracy_score(y_test, y_pred)
cv_best = grid_search.best_score_

print(f"\n[GridSearchCV] Best params: {grid_search.best_params_}")
print(f"[GridSearchCV] Best CV accuracy: {cv_best:.4f}")
print(f"[Random Forest] Test accuracy: {test_acc:.4f}")

# Cross-validation detailed results
cv_results = pd.DataFrame(grid_search.cv_results_)
top5 = cv_results.nsmallest(5, 'rank_test_score')[['params', 'mean_test_score', 'std_test_score', 'rank_test_score']]
print("\n[Top-5 Hyperparameter Combinations]")
for _, row in top5.iterrows():
    print(f"  Rank {int(row['rank_test_score'])}: acc={row['mean_test_score']:.4f}±{row['std_test_score']:.4f}  {row['params']}")

# ===================== 7. Classification Report =====================
print("\n[Classification Report — Random Forest]")
print(classification_report(y_test, y_pred, target_names=modulations, digits=4))

# ===================== 8. Confusion Matrix =====================
cm = confusion_matrix(y_test, y_pred)
cm_pct = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis] * 100

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 5))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues', ax=ax1,
            xticklabels=modulations, yticklabels=modulations)
ax1.set_title('(a) Count', fontsize=12)
ax1.set_xlabel('Predicted', fontsize=11)
ax1.set_ylabel('True', fontsize=11)

sns.heatmap(cm_pct, annot=True, fmt='.1f', cmap='Blues', ax=ax2,
            xticklabels=modulations, yticklabels=modulations)
ax2.set_title('(b) Percentage (%)', fontsize=12)
ax2.set_xlabel('Predicted', fontsize=11)
ax2.set_ylabel('True', fontsize=11)

plt.suptitle('Fig. 3. Confusion Matrix of Random Forest Classifier (Test Set)', fontsize=14)
plt.tight_layout(rect=[0, 0, 1, 0.94])
plt.savefig('fig3_confusion_matrix.png', dpi=200, bbox_inches='tight')
plt.show()
plt.close()
print("\n[Saved] fig3_confusion_matrix.png")

# ===================== 9. Feature Importance =====================
importances = best_rf.feature_importances_
indices = np.argsort(importances)[::-1]

fig, ax = plt.subplots(figsize=(8, 5))
bars = ax.bar(range(len(importances)), importances[indices], color='steelblue', edgecolor='navy')
ax.set_xticks(range(len(importances)))
ax.set_xticklabels(np.array(feature_names)[indices], fontsize=12)
ax.set_ylabel('Importance Score', fontsize=12)
ax.set_title('Fig. 4. Feature Importance Ranking (Random Forest, MDI)', fontsize=14)
for i, (v, idx) in enumerate(zip(importances[indices], indices)):
    ax.text(i, v + 0.005, f'{v:.3f}', ha='center', fontsize=10)
ax.grid(axis='y', alpha=0.3)
plt.tight_layout()
plt.savefig('fig4_feature_importance.png', dpi=200, bbox_inches='tight')
plt.show()
plt.close()
print("[Saved] fig4_feature_importance.png")

print("\n[Feature Importance Ranking]")
for rank, idx in enumerate(indices):
    print(f"  #{rank+1}: {feature_names[idx]} = {importances[idx]:.4f}")

# ===================== 10. ROC Curve (Multi-class OvR) =====================
y_test_bin = label_binarize(y_test, classes=range(n_classes))
y_score = best_rf.predict_proba(X_test)

fpr, tpr, roc_auc_dict = {}, {}, {}
for i in range(n_classes):
    fpr[i], tpr[i], _ = roc_curve(y_test_bin[:, i], y_score[:, i])
    roc_auc_dict[i] = auc(fpr[i], tpr[i])

# Micro-average
fpr['micro'], tpr['micro'], _ = roc_curve(y_test_bin.ravel(), y_score.ravel())
roc_auc_dict['micro'] = auc(fpr['micro'], tpr['micro'])

fig, ax = plt.subplots(figsize=(8, 6))
colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728']
for i, mod in enumerate(modulations):
    ax.plot(fpr[i], tpr[i], color=colors[i], lw=2,
            label=f'{mod} (AUC = {roc_auc_dict[i]:.3f})')
ax.plot(fpr['micro'], tpr['micro'], color='black', lw=2, linestyle='--',
        label=f'Micro-avg (AUC = {roc_auc_dict["micro"]:.3f})')
ax.plot([0, 1], [0, 1], 'k:', lw=1, alpha=0.5)
ax.set_xlim([-0.02, 1.02])
ax.set_ylim([-0.02, 1.05])
ax.set_xlabel('False Positive Rate', fontsize=12)
ax.set_ylabel('True Positive Rate', fontsize=12)
ax.set_title('Fig. 5. Multi-class ROC Curves (One-vs-Rest)', fontsize=14)
ax.legend(loc='lower right', fontsize=10)
ax.grid(alpha=0.3)
plt.tight_layout()
plt.savefig('fig5_roc_curve.png', dpi=200, bbox_inches='tight')
plt.show()
plt.close()
print("[Saved] fig5_roc_curve.png")

print("\n[AUC Values]")
for i, mod in enumerate(modulations):
    print(f"  {mod}: AUC = {roc_auc_dict[i]:.4f}")
print(f"  Micro-avg: AUC = {roc_auc_dict['micro']:.4f}")

# ===================== 11. Learning Curve =====================
train_sizes_abs, train_scores_lc, test_scores_lc = learning_curve(
    best_rf, X_scaled, y, cv=5,
    train_sizes=np.linspace(0.1, 1.0, 10),
    scoring='accuracy', n_jobs=-1, random_state=42
)
train_mean = np.mean(train_scores_lc, axis=1)
train_std = np.std(train_scores_lc, axis=1)
test_mean = np.mean(test_scores_lc, axis=1)
test_std = np.std(test_scores_lc, axis=1)

fig, ax = plt.subplots(figsize=(8, 5))
ax.fill_between(train_sizes_abs, train_mean - train_std, train_mean + train_std, alpha=0.1, color='blue')
ax.fill_between(train_sizes_abs, test_mean - test_std, test_mean + test_std, alpha=0.1, color='orange')
ax.plot(train_sizes_abs, train_mean, 'o-', color='blue', label='Training Accuracy', lw=2)
ax.plot(train_sizes_abs, test_mean, 's-', color='orange', label='Cross-Validation Accuracy', lw=2)
ax.set_xlabel('Number of Training Samples', fontsize=12)
ax.set_ylabel('Accuracy', fontsize=12)
ax.set_title('Fig. 6. Learning Curve (Bias-Variance Diagnosis)', fontsize=14)
ax.legend(fontsize=11)
ax.grid(alpha=0.3)
ax.set_ylim([0.85, 1.02])
plt.tight_layout()
plt.savefig('fig6_learning_curve.png', dpi=200, bbox_inches='tight')
plt.show()
plt.close()
print("[Saved] fig6_learning_curve.png")

print("\n[Learning Curve Data]")
for sz, tr, te in zip(train_sizes_abs, train_mean, test_mean):
    print(f"  n={sz:4d}: train={tr:.4f}, cv={te:.4f}, gap={tr-te:.4f}")

# ===================== 12. SNR Sweep Experiment =====================
print("\n" + "=" * 65)
print("  Experiment: SNR vs. Classification Accuracy")
print("=" * 65)

snr_dBs = [0, 5, 10, 15, 20, 25, 30]
snr_results = {}

for snr_db in snr_dBs:
    snr_linear = 10 ** (snr_db / 10.0)
    # Noise variance inversely proportional to SNR
    noise_scale = 1.0 / snr_linear
    cov_snr = cov_high_snr * noise_scale

    X_snr, y_snr = [], []
    for idx, mod in enumerate(modulations):
        mean_vec = np.array(theoretical[mod])
        feats = np.random.multivariate_normal(mean_vec, cov_snr, n_samples_per_class)
        X_snr.append(feats)
        y_snr.extend([idx] * n_samples_per_class)

    X_snr = np.vstack(X_snr)
    y_snr = np.array(y_snr)

    scaler_snr = StandardScaler()
    X_snr_scaled = scaler_snr.fit_transform(X_snr)

    X_tr, X_te, y_tr, y_te = train_test_split(
        X_snr_scaled, y_snr, test_size=0.3, random_state=42, stratify=y_snr
    )

    rf_snr = RandomForestClassifier(**grid_search.best_params_, random_state=42, n_jobs=-1)
    rf_snr.fit(X_tr, y_tr)
    acc_snr = accuracy_score(y_te, rf_snr.predict(X_te))
    snr_results[snr_db] = acc_snr
    print(f"  SNR = {snr_db:2d} dB -> Accuracy = {acc_snr:.4f}")

# Plot SNR vs Accuracy
fig, ax = plt.subplots(figsize=(8, 5))
ax.plot(snr_dBs, [snr_results[s] for s in snr_dBs], 'o-', color='steelblue', lw=2, markersize=8)
ax.set_xlabel('SNR (dB)', fontsize=12)
ax.set_ylabel('Classification Accuracy', fontsize=12)
ax.set_title('Fig. 7. Classification Accuracy vs. SNR', fontsize=14)
ax.set_xticks(snr_dBs)
ax.set_ylim([0.0, 1.05])
ax.grid(alpha=0.3)
for snr_db, acc in snr_results.items():
    ax.annotate(f'{acc:.2f}', (snr_db, acc), textcoords="offset points",
                xytext=(0, 10), ha='center', fontsize=9)
plt.tight_layout()
plt.savefig('fig7_snr_sweep.png', dpi=200, bbox_inches='tight')
plt.show()
plt.close()
print("\n[Saved] fig7_snr_sweep.png")

# ===================== 13. Baseline Comparison (KNN, Decision Tree) =====================
print("\n" + "=" * 65)
print("  Baseline Comparison: RF vs. KNN vs. Decision Tree")
print("=" * 65)

baselines = {
    'Decision Tree': DecisionTreeClassifier(random_state=42),
    'KNN (k=5)': KNeighborsClassifier(n_neighbors=5, n_jobs=-1),
    'Random Forest': best_rf,
}

comparison_results = {}
for name, clf in baselines.items():
    t0 = time.time()
    if name != 'Random Forest':
        clf.fit(X_train, y_train)
    train_time = time.time() - t0

    t0 = time.time()
    y_pred_bl = clf.predict(X_test)
    test_time = time.time() - t0

    acc = accuracy_score(y_test, y_pred_bl)
    comparison_results[name] = {
        'accuracy': acc,
        'train_time': train_time,
        'test_time': test_time,
        'y_pred': y_pred_bl,
    }
    print(f"  {name:<20s}: acc={acc:.4f}, train={train_time:.4f}s, test={test_time:.4f}s")

# Comparison bar chart
fig, ax = plt.subplots(figsize=(8, 5))
names = list(comparison_results.keys())
accs = [comparison_results[n]['accuracy'] for n in names]
colors_bar = ['#2ca02c', '#ff7f0e', '#1f77b4']
bars = ax.bar(names, accs, color=colors_bar, edgecolor='black', width=0.5)
for bar, acc in zip(bars, accs):
    ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.005,
            f'{acc:.3f}', ha='center', fontsize=12)
ax.set_ylabel('Test Accuracy', fontsize=12)
ax.set_title('Fig. 8. Algorithm Comparison (Test Set Accuracy)', fontsize=14)
ax.set_ylim([0.7, 1.02])
ax.grid(axis='y', alpha=0.3)
plt.tight_layout()
plt.savefig('fig8_comparison.png', dpi=200, bbox_inches='tight')
plt.show()
plt.close()
print("\n[Saved] fig8_comparison.png")

# Comparison table
print("\n[Comparison Table]")
print("-" * 65)
print(f"{'Algorithm':<20s} {'Accuracy':>10s} {'Train(s)':>10s} {'Test(s)':>10s}")
print("-" * 65)
for name in names:
    r = comparison_results[name]
    print(f"{name:<20s} {r['accuracy']:>10.4f} {r['train_time']:>10.4f} {r['test_time']:>10.4f}")
print("-" * 65)

# Per-class comparison
print("\n[Per-Class F1-Score Comparison]")
from sklearn.metrics import f1_score
print("-" * 55)
print(f"{'Algorithm':<20s}", end="")
for mod in modulations:
    print(f"{mod:>8s}", end="")
print(f"{'Macro-F1':>10s}")
print("-" * 55)
for name in names:
    y_pred_bl = comparison_results[name]['y_pred']
    f1_per_class = f1_score(y_test, y_pred_bl, average=None)
    f1_macro = f1_score(y_test, y_pred_bl, average='macro')
    print(f"{name:<20s}", end="")
    for f1 in f1_per_class:
        print(f"{f1:>8.3f}", end="")
    print(f"{f1_macro:>10.3f}")
print("-" * 55)

# ===================== 14. Summary Output =====================
print("\n" + "=" * 65)
print("  ALL EXPERIMENTS COMPLETE")
print("=" * 65)
print("\nGenerated figures:")
print("  fig1_feature_distribution.png  — HOC feature distributions")
print("  fig2_constellation.png         — Constellation diagrams")
print("  fig3_confusion_matrix.png      — Confusion matrix (count + %)")
print("  fig4_feature_importance.png    — Feature importance (MDI)")
print("  fig5_roc_curve.png             — Multi-class ROC (OvR)")
print("  fig6_learning_curve.png        — Learning curve")
print("  fig7_snr_sweep.png             — SNR vs Accuracy")
print("  fig8_comparison.png            — Algorithm comparison")
print("\nTo download: Left sidebar -> Files -> right-click -> Download")
print("=" * 65)
