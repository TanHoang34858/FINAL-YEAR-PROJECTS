package com.example.langthangcoffee.adapters;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.langthangcoffee.R;
import com.example.langthangcoffee.activities.MainActivity;
import com.example.langthangcoffee.fragments.ChiTietDatHangAdminDaHuyFragment;
import com.example.langthangcoffee.models.DonHang;
import com.example.langthangcoffee.models.LichSuOrder;

import java.util.List;

@SuppressWarnings("deprecation")
public class BillOrderAdminDaHuyAdapter extends RecyclerView.Adapter<BillOrderAdminDaHuyAdapter.FoodOrderViewHolder> {
    private List<DonHang> mBillOrder;
    MainActivity mainActivity;
    BillOrderAdminDaHuyAdapter billOrderAdminDaHuyAdapter;


    public BillOrderAdminDaHuyAdapter(List<DonHang> mBillOrder, MainActivity mainActivity) {
        this.mBillOrder = mBillOrder;
        this.mainActivity = mainActivity;
        billOrderAdminDaHuyAdapter = this;
    }

    @NonNull
    @Override
    public FoodOrderViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_lich_su_don_hang_hoan_tat_admin, parent, false);
        return new FoodOrderViewHolder(view);
    }

    @SuppressLint("SetTextI18n")
    @Override
    public void onBindViewHolder(@NonNull final FoodOrderViewHolder holder, @SuppressLint("RecyclerView") int position) {
        final DonHang donHang = mBillOrder.get(position);
        if (donHang == null) {
            return;
        }
        holder.tvTaiKhoan.setText("Phone number: " + (donHang.getSdtKhachHang()));
        holder.tvMaDonHang.setText("Code orders: " + String.valueOf(donHang.getMaDonHang()));
        holder.tvTongTien.setText("Total: " + String.valueOf(donHang.getSoTienThanhToan()) + " đ");
        holder.tvThoiGian.setText("Time: " + donHang.getThoiGianDatHang());
        List<LichSuOrder> lichSuOrderList = donHang.getLichSuOrderList();
        String chiTietDonHang = "";
        for (int i = 0; i < lichSuOrderList.size(); i++) {
            String orderDetail = "";
            orderDetail = "x" + lichSuOrderList.get(i).getSoLuong() + " " + lichSuOrderList.get(i).getTenSanPham();
            if (i != lichSuOrderList.size() - 1) {
                orderDetail += ", ";
            }
            chiTietDonHang += orderDetail;
        }
        holder.tvDetail.setText("Detail: " + chiTietDonHang);

        holder.lnItemDonHang.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ChiTietDatHangAdminDaHuyFragment chiTietDatHangAdminDaHuyFragment = new ChiTietDatHangAdminDaHuyFragment(billOrderAdminDaHuyAdapter);
                Bundle bundle = new Bundle();
                bundle.putSerializable("donHang", donHang); // Put anything what you want
                chiTietDatHangAdminDaHuyFragment.setArguments(bundle);
                mainActivity.loadFragment(chiTietDatHangAdminDaHuyFragment);
            }
        });

    }

    @Override
    public int getItemCount() {
        if (mBillOrder != null) {
            return mBillOrder.size();
        }
        return 0;
    }

    public static class FoodOrderViewHolder extends RecyclerView.ViewHolder {
        ;
        private final TextView tvMaDonHang, tvDetail, tvTongTien, tvThoiGian, tvTaiKhoan;
        private  final LinearLayout lnItemDonHang;


        public FoodOrderViewHolder(@NonNull View itemView) {
            super(itemView);


            tvMaDonHang = itemView.findViewById(R.id.tv_ma_don_hang);
            tvDetail = itemView.findViewById(R.id.tv_detail);
            tvTongTien = itemView.findViewById(R.id.tv_tong_tien);
            tvThoiGian = itemView.findViewById(R.id.tv_thoi_gian);

            lnItemDonHang = itemView.findViewById(R.id.ln_item_don_hang);
            tvTaiKhoan = itemView.findViewById(R.id.tv_sdt_don_hang);


        }
    }
}

