// Stub replacement for tri_mode_ethernet_mac_0 IP
// This module has the same ports as the Xilinx TEMAC IP but drives safe defaults.
// Ethernet will NOT function - this is a placeholder to allow bitstream generation
// without the licensed tri_mode_eth_mac IP core.
module tri_mode_ethernet_mac_0 (
    input                gtx_clk,
    input                gtx_clk90,
    input                glbl_rstn,
    input                rx_axi_rstn,
    input                tx_axi_rstn,

    // Receiver Interface
    output               rx_enable,
    output      [27:0]   rx_statistics_vector,
    output               rx_statistics_valid,
    output               rx_mac_aclk,
    output               rx_reset,
    output      [7:0]    rx_axis_mac_tdata,
    output               rx_axis_mac_tvalid,
    output               rx_axis_mac_tlast,
    output               rx_axis_mac_tuser,
    output      [4:0]    rx_axis_filter_tuser,

    // Transmitter Interface
    output               tx_enable,
    input       [7:0]    tx_ifg_delay,
    output      [31:0]   tx_statistics_vector,
    output               tx_statistics_valid,
    output               tx_mac_aclk,
    output               tx_reset,
    input       [7:0]    tx_axis_mac_tdata,
    input                tx_axis_mac_tvalid,
    input                tx_axis_mac_tlast,
    input                tx_axis_mac_tuser,
    output               tx_axis_mac_tready,

    // MAC Control Interface
    input                pause_req,
    input       [15:0]   pause_val,

    output               speedis100,
    output               speedis10100,

    // RGMII Interface
    output      [3:0]    rgmii_txd,
    output               rgmii_tx_ctl,
    output               rgmii_txc,
    input       [3:0]    rgmii_rxd,
    input                rgmii_rx_ctl,
    input                rgmii_rxc,
    output               inband_link_status,
    output      [1:0]    inband_clock_speed,
    output               inband_duplex_status,

    // MDIO Interface
    inout                mdio,
    output               mdc,

    // AXI-Lite Interface
    input                s_axi_aclk,
    input                s_axi_resetn,
    input       [11:0]   s_axi_awaddr,
    input                s_axi_awvalid,
    output               s_axi_awready,
    input       [31:0]   s_axi_wdata,
    input                s_axi_wvalid,
    output               s_axi_wready,
    output      [1:0]    s_axi_bresp,
    output               s_axi_bvalid,
    input                s_axi_bready,
    input       [11:0]   s_axi_araddr,
    input                s_axi_arvalid,
    output               s_axi_arready,
    output      [31:0]   s_axi_rdata,
    output      [1:0]    s_axi_rresp,
    output               s_axi_rvalid,
    input                s_axi_rready,
    output               mac_irq
);

    // Reset synchronizer
    wire rst = ~glbl_rstn;

    // Clock outputs
    assign rx_mac_aclk = gtx_clk;
    assign tx_mac_aclk = gtx_clk;

    // Reset outputs (active high)
    assign rx_reset = rst;
    assign tx_reset = rst;

    // Receiver - inactive
    assign rx_enable = 1'b0;
    assign rx_statistics_vector = 28'd0;
    assign rx_statistics_valid = 1'b0;
    assign rx_axis_mac_tdata = 8'd0;
    assign rx_axis_mac_tvalid = 1'b0;
    assign rx_axis_mac_tlast = 1'b0;
    assign rx_axis_mac_tuser = 1'b0;
    assign rx_axis_filter_tuser = 5'd0;

    // Transmitter - always ready, no output
    assign tx_enable = 1'b0;
    assign tx_statistics_vector = 32'd0;
    assign tx_statistics_valid = 1'b0;
    assign tx_axis_mac_tready = 1'b1;

    // Speed indicators
    assign speedis100 = 1'b0;
    assign speedis10100 = 1'b0;

    // RGMII - idle
    assign rgmii_txd = 4'd0;
    assign rgmii_tx_ctl = 1'b0;
    assign rgmii_txc = 1'b0;

    // In-band status
    assign inband_link_status = 1'b0;
    assign inband_clock_speed = 2'd0;
    assign inband_duplex_status = 1'b0;

    // MDIO - tri-state
    assign mdio = 1'bz;
    assign mdc = 1'b0;

    // AXI-Lite - always acknowledge writes, return zero on reads
    reg s_axi_awready_r;
    reg s_axi_wready_r;
    reg s_axi_bvalid_r;
    reg s_axi_arready_r;
    reg s_axi_rvalid_r;

    assign s_axi_awready = s_axi_awready_r;
    assign s_axi_wready = s_axi_wready_r;
    assign s_axi_bresp = 2'b00;
    assign s_axi_bvalid = s_axi_bvalid_r;
    assign s_axi_arready = s_axi_arready_r;
    assign s_axi_rdata = 32'd0;
    assign s_axi_rresp = 2'b00;
    assign s_axi_rvalid = s_axi_rvalid_r;
    assign mac_irq = 1'b0;

    // Simple AXI-Lite response logic
    always @(posedge s_axi_aclk) begin
        if (~s_axi_resetn) begin
            s_axi_awready_r <= 1'b0;
            s_axi_wready_r <= 1'b0;
            s_axi_bvalid_r <= 1'b0;
            s_axi_arready_r <= 1'b0;
            s_axi_rvalid_r <= 1'b0;
        end else begin
            // Write address channel
            s_axi_awready_r <= s_axi_awvalid & ~s_axi_awready_r;
            // Write data channel
            s_axi_wready_r <= s_axi_wvalid & ~s_axi_wready_r;
            // Write response
            if (s_axi_bvalid_r & s_axi_bready)
                s_axi_bvalid_r <= 1'b0;
            else if (s_axi_awready_r & s_axi_wready_r)
                s_axi_bvalid_r <= 1'b1;
            // Read address channel
            s_axi_arready_r <= s_axi_arvalid & ~s_axi_arready_r;
            // Read data
            if (s_axi_rvalid_r & s_axi_rready)
                s_axi_rvalid_r <= 1'b0;
            else if (s_axi_arready_r)
                s_axi_rvalid_r <= 1'b1;
        end
    end

endmodule
