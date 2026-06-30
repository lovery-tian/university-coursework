# -*- coding: utf-8 -*-
"""
调制信号自动识别 - 完整版
适用于：Python与人工智能课程报告
算法：随机森林 + GridSearchCV
特征：高阶累积量（7维）
数据集：模拟真实通信信号统计特性
"""

# ==================== 1. 安装与导入 ====================
import sys
sys.stdout.reconfigure(encoding='utf-8')
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use('Agg')  # 非交互模式，保存文件用
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split, GridSearchCV, learning_curve
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import classification_report, confusion_matrix, roc_curve, auc
import warnings
warnings.filterwarnings('ignore')

# 设置中文显示
plt.rcParams['font.sans-serif'] = ['SimHei', 'DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False

# 保存路径
SAVE_DIR = 'E:/专业课/python/'

print("="*60)
print("调制信号自动识别系统 - 随机森林模型")
print("="*60)

# ==================== 2. 生成模拟数据（基于通信理论） ====================
np.random.seed(42)
n_samples_per_class = 500
modulations = ['BPSK', 'QPSK', '8PSK', '16QAM']
n_classes = len(modulations)

theoretical = {
    'BPSK':  [1.0, 1.0, -2.0, -2.0, -2.0, 0.0, 0.0],
    'QPSK':  [0.0, 1.0, -1.0, -1.0, -1.0, 0.0, 0.0],
    '8PSK':  [0.0, 1.0, 0.0, 0.0, -1.0, 0.0, 0.0],
    '16QAM': [0.0, 1.0, -0.68, -0.68, -0.68, 0.0, 0.0]
}
feature_names = ['C20', 'C21', 'C40', 'C41', 'C42', 'C60', 'C63']

X_list, y_list = [], []
for idx, mod in enumerate(modulations):
    mean_vec = theoretical[mod]
    cov = np.diag([0.05, 0.02, 0.1, 0.1, 0.1, 0.03, 0.03])
    features = np.random.multivariate_normal(mean_vec, cov, n_samples_per_class)
    X_list.append(features)
    y_list.append([idx] * n_samples_per_class)

X = np.vstack(X_list)
y = np.hstack(y_list)

df = pd.DataFrame(X, columns=feature_names)
df['调制类型'] = [modulations[i] for i in y]

print("\n【数据集信息】")
print(f"样本总数: {len(df)}")
print(f"特征维度: {len(feature_names)}")
print(f"类别分布:\n{df['调制类型'].value_counts()}")
print("\n前5行数据预览:")
print(df.head())

# ==================== 3. 可视化1：特征分布 ====================
plt.figure(figsize=(14, 10))
for i, feat in enumerate(feature_names):
    plt.subplot(3, 3, i+1)
    for mod in modulations:
        sns.kdeplot(df[df['调制类型']==mod][feat], label=mod, fill=True, alpha=0.5)
    plt.title(f'{feat} 概率密度分布')
    plt.xlabel(feat)
    plt.ylabel('密度')
plt.tight_layout()
plt.savefig(SAVE_DIR + '特征分布图.png', dpi=150)
plt.close()
print("\n✅ 已保存图片: 特征分布图.png")

# ==================== 4. 数据预处理 ====================
X_features = df[feature_names].values
y_labels = y.copy()

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X_features)

X_train, X_test, y_train, y_test = train_test_split(
    X_scaled, y_labels, test_size=0.3, random_state=42, stratify=y_labels
)
print(f"\n训练集样本数: {len(X_train)}，测试集样本数: {len(X_test)}")

# ==================== 5. 随机森林模型与超参数调优 ====================
rf_base = RandomForestClassifier(random_state=42, n_estimators=100)
rf_base.fit(X_train, y_train)
base_acc = rf_base.score(X_test, y_test)
print(f"\n基础随机森林准确率: {base_acc:.4f}")

param_grid = {
    'n_estimators': [50, 100, 200],
    'max_depth': [10, 20, None],
    'min_samples_split': [2, 5]
}
grid_search = GridSearchCV(
    RandomForestClassifier(random_state=42),
    param_grid,
    cv=5,
    scoring='accuracy',
    n_jobs=-1
)
grid_search.fit(X_train, y_train)

best_rf = grid_search.best_estimator_
test_acc = best_rf.score(X_test, y_test)

print("\n【超参数优化结果】")
print(f"最佳参数组合: {grid_search.best_params_}")
print(f"交叉验证最佳准确率: {grid_search.best_score_:.4f}")
print(f"测试集准确率: {test_acc:.4f}")

# ==================== 6. 可视化2：特征重要性 ====================
importances = best_rf.feature_importances_
indices = np.argsort(importances)[::-1]

plt.figure(figsize=(8, 5))
plt.bar(range(len(importances)), importances[indices], color='steelblue')
plt.xticks(range(len(importances)), np.array(feature_names)[indices], rotation=45)
plt.title('特征重要性排序 (基于随机森林)')
plt.ylabel('重要性分数')
for i, v in enumerate(importances[indices]):
    plt.text(i, v + 0.01, f'{v:.3f}', ha='center')
plt.tight_layout()
plt.savefig(SAVE_DIR + '特征重要性.png', dpi=150)
plt.close()
print("\n✅ 已保存图片: 特征重要性.png")

# ==================== 7. 可视化3：混淆矩阵 ====================
y_pred = best_rf.predict(X_test)
cm = confusion_matrix(y_test, y_pred)

plt.figure(figsize=(6, 5))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
            xticklabels=modulations, yticklabels=modulations)
plt.title('混淆矩阵 (测试集)')
plt.xlabel('预测类别')
plt.ylabel('真实类别')
plt.tight_layout()
plt.savefig(SAVE_DIR + '混淆矩阵.png', dpi=150)
plt.close()
print("\n✅ 已保存图片: 混淆矩阵.png")

print("\n【分类报告】")
print(classification_report(y_test, y_pred, target_names=modulations))

# ==================== 8. 可视化4：ROC曲线与AUC ====================
y_test_onehot = np.eye(n_classes)[y_test]
y_score = best_rf.predict_proba(X_test)

fpr, tpr, roc_auc = {}, {}, {}
plt.figure(figsize=(8, 6))
for i, mod in enumerate(modulations):
    fpr[i], tpr[i], _ = roc_curve(y_test_onehot[:, i], y_score[:, i])
    roc_auc[i] = auc(fpr[i], tpr[i])
    plt.plot(fpr[i], tpr[i], lw=2, label=f'{mod} (AUC = {roc_auc[i]:.3f})')
plt.plot([0, 1], [0, 1], 'k--', lw=2)
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('假正率 (False Positive Rate)')
plt.ylabel('真正率 (True Positive Rate)')
plt.title('多分类 ROC 曲线 (One-vs-Rest)')
plt.legend(loc='lower right')
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig(SAVE_DIR + 'ROC曲线.png', dpi=150)
plt.close()
print("\n✅ 已保存图片: ROC曲线.png")

# ==================== 9. 可视化5：学习曲线 ====================
train_sizes, train_scores, test_scores = learning_curve(
    best_rf, X_scaled, y_labels, cv=5,
    train_sizes=np.linspace(0.1, 1.0, 10),
    scoring='accuracy', n_jobs=-1
)
train_mean = np.mean(train_scores, axis=1)
test_mean = np.mean(test_scores, axis=1)

plt.figure(figsize=(8, 5))
plt.plot(train_sizes, train_mean, 'o-', label='训练集准确率')
plt.plot(train_sizes, test_mean, 's-', label='交叉验证准确率')
plt.xlabel('训练样本数量')
plt.ylabel('准确率')
plt.title('学习曲线 (验证模型是否过拟合/欠拟合)')
plt.legend()
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig(SAVE_DIR + '学习曲线.png', dpi=150)
plt.close()
print("\n✅ 已保存图片: 学习曲线.png")

# ==================== 10. 可视化6：模拟星座图 ====================
fig, axes = plt.subplots(2, 2, figsize=(10, 8))
for idx, mod in enumerate(modulations):
    ax = axes[idx//2, idx%2]
    if mod == 'BPSK':
        i = np.random.choice([-1, 1], 100) + np.random.normal(0, 0.2, 100)
        q = np.random.normal(0, 0.2, 100)
    elif mod == 'QPSK':
        i = np.random.choice([-1, 1], 100) + np.random.normal(0, 0.2, 100)
        q = np.random.choice([-1, 1], 100) + np.random.normal(0, 0.2, 100)
    elif mod == '8PSK':
        angles = np.random.choice([0,45,90,135,180,225,270,315], 100) * np.pi/180
        i = np.cos(angles) + np.random.normal(0, 0.2, 100)
        q = np.sin(angles) + np.random.normal(0, 0.2, 100)
    else:  # 16QAM
        i_vals = np.random.choice([-3,-1,1,3], 100)
        q_vals = np.random.choice([-3,-1,1,3], 100)
        i = i_vals + np.random.normal(0, 0.3, 100)
        q = q_vals + np.random.normal(0, 0.3, 100)
    ax.scatter(i, q, alpha=0.6, s=20)
    ax.set_title(f'{mod} 模拟星座图 (含噪声)')
    ax.set_xlabel('I (同相)')
    ax.set_ylabel('Q (正交)')
    ax.grid(alpha=0.3)
plt.tight_layout()
plt.savefig(SAVE_DIR + '模拟星座图.png', dpi=150)
plt.close()
print("\n✅ 已保存图片: 模拟星座图.png")

print("\n" + "="*60)
print("所有分析已完成！生成的图片：")
print("  - 特征分布图.png")
print("  - 特征重要性.png")
print("  - 混淆矩阵.png")
print("  - ROC曲线.png")
print("  - 学习曲线.png")
print("  - 模拟星座图.png")
print("="*60)
