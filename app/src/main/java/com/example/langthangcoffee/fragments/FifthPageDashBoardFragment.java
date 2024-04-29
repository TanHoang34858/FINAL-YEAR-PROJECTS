package com.example.langthangcoffee.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.langthangcoffee.R;
import com.example.langthangcoffee.models.SweetCake;
import com.example.langthangcoffee.adapters.SweetCakeAdapter;

import java.util.ArrayList;
import java.util.List;

public class FifthPageDashBoardFragment extends Fragment implements View.OnClickListener {
    GridLayoutManager gridLayoutManager;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        ViewGroup v = (ViewGroup) inflater.inflate(R.layout.fragment_fifth_page_dash_board, container, false);

        RecyclerView recyclerView = v.findViewById(R.id.rcv_page_5_dash_board);
        gridLayoutManager = new GridLayoutManager(getContext(), 2);
        recyclerView.setLayoutManager(gridLayoutManager);

        SweetCakeAdapter sweetCakeAdapter = new SweetCakeAdapter(getListSweetCake());
        recyclerView.setAdapter(sweetCakeAdapter);

        return v;
    }

    private List<SweetCake> getListSweetCake() {
        List<SweetCake> list = new ArrayList<>();

        list.add(new SweetCake(R.drawable.b1,"Raisin rolls","30000 đ"));
        list.add(new SweetCake(R.drawable.b2,"Sesame toast","30000 đ"));
        list.add(new SweetCake(R.drawable.b3,"Croissants","30000 đ"));
        list.add(new SweetCake(R.drawable.b4,"Sweet honey cake","30000 đ"));
        list.add(new SweetCake(R.drawable.b5,"Strawberry cake","30000 đ"));
        list.add(new SweetCake(R.drawable.b6,"Salted egg cake","30000 đ"));
        list.add(new SweetCake(R.drawable.b7,"Honey wafflesg","30000 đ"));
        list.add(new SweetCake(R.drawable.b8,"Baked egg cake","30000 đ"));
        return list;
    }


    @Override
    public void onClick(View v) {

    }
}
