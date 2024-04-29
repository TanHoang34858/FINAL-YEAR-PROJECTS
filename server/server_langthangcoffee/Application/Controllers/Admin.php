<?php

use MVC\Controller;

class ControllersAdmin extends Controller
{

    public function getDonHangDangCho()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('donhang');

            $danhSachDonHang = $model->getAllDHDangChoAdmin();
            foreach ($danhSachDonHang as &$donHang) {
                $lichSuOrderList = $this->model("lichsuorder")->getLichSuOrder($donHang["MaDonHang"]);

                $lichSuOrderToppingList = $this->model("lichsuorder")->getLichSuOrderTopping($donHang["MaDonHang"]);


                foreach ($lichSuOrderList as &$lichSuOrder) {
                    $arrayTopping = array();
                    $p = 0;
                    foreach ($lichSuOrderToppingList as $lichSuOrderTopping) {
                        if ($lichSuOrder["MaLichSuOrder"] == $lichSuOrderTopping["MaLichSuOrder"]) {
                            array_push($arrayTopping, $lichSuOrderTopping);
                            array_splice($lichSuOrderToppingList, $p, 1);
                            $p--;
                        }
                        $p++;
                    }

                    $lichSuOrder["Topping"] =  $arrayTopping;
                }
                $donHang["lichSuOrder"] = $lichSuOrderList;
            }


            // Prepare Data
            $data = ['data' =>  $danhSachDonHang];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function sendNotification()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('donhang');

            $token = $this->request->input("Token");
            $result =  $model->sendNotification($token, "Test", "Test");


            // Prepare Data
            $data = ['data' =>  $result];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function getDanhSachSanPham()
    {
        if ($this->request->getMethod() == "GET") {
            // Connect to database
            $model = $this->model('sanpham');


            $danhSachSanPham =  $model->getAllSanPhamAdmin();
            foreach ($danhSachSanPham as &$sanPham) {
                $danhSachKichThuoc = $this->model("kichthuocsanpham")->getKichThuoc($sanPham["MaSanPham"]);
                $danhSachTopping = $this->model("toppingsanpham")->getTopping($sanPham["MaSanPham"]);
                $sanPham["kichThuoc"] = $danhSachKichThuoc;
                $sanPham["topping"] = $danhSachTopping;
                $sanPham["TenKichThuoc"] =  $danhSachKichThuoc[0]["TenKichThuoc"];
                $sanPham["GiaTien"] =  $danhSachKichThuoc[0]["GiaTien"];
            }
            // Prepare Data
            $data = ['data' =>  $danhSachSanPham];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function getDanhSachTaiKhoan()
    {
        if ($this->request->getMethod() == "GET") {
            // Connect to database
            $model = $this->model('taikhoan');
            $danhSachTaiKhoan =  $model->getAllTaiKhoanAdmin();
            // Prepare Data
            $data = ['data' =>  $danhSachTaiKhoan];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function getDanhSachVoucher()
    {
        if ($this->request->getMethod() == "GET") {
            // Connect to database
            $model = $this->model('voucher');
            $danhSachVoucher =  $model->getDanhSachAdmin();
            // Prepare Data
            $data = ['data' =>  $danhSachVoucher];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function getDanhSachLoaiVoucher()
    {
        if ($this->request->getMethod() == "GET") {
            // Connect to database
            $model = $this->model('loaivoucher');
            $danhSachLoaiVoucher =  $model->getDanhSachAdmin();
            // Prepare Data
            $data = ['data' =>  $danhSachLoaiVoucher];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }

    public function capNhatTaiKhoan()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('taikhoan');
            $soDienThoai = $this->request->input("SDTTaiKhoan");
            $data = [
                "Ho" => $this->request->input("Ho"),
                "Ten" =>  $this->request->input("Ten"),
                "DiaChiGiaoHang" =>  $this->request->input("DiaChiGiaoHang"),
                "MaQuyenHan" =>  $this->request->input("MaQuyenHan"),

            ];

            $model->capNhatTaiKhoanAdmin($data, "SDTTaiKhoan = '" . $soDienThoai . "' ");

            // Prepare Data
            $data = ['message' =>  "Update successful"];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function xoaTaiKhoan()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('taikhoan');
            $soDienThoai = $this->request->input("SDTTaiKhoan");
            $this->model("sanphamyeuthich")->xoaTatCaBySDT($soDienThoai);

            // get danh sach don hang

            $danhSachDonHang = $this->model("donhang")->getAllDHBySDT($soDienThoai);
            foreach ($danhSachDonHang as $donHang) {
                // get lich su order
                $lichSuOrder = $this->model("lichsuorder")->getLichSuOrder($donHang["MaDonHang"]);
                foreach ($lichSuOrder as $order) {
                    $this->model("lichsuordertopping")->deleteLichSuOrderTopping($order["MaLichSuOrder"]);
                    $this->model("lichsuorder")->deleteLichSuOrder($order["MaLichSuOrder"]);
                }
                $this->model("donhang")->deleteDonHang($donHang["MaDonHang"]);
            }

            $this->model("voucher")->xoaTatCaBySDT($soDienThoai);

            $this->model("taikhoan")->deleteTaiKhoan($soDienThoai);

            // Prepare Data
            $data = ['message' =>  "Deleted successfully"];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function getThongTinDoanhThu()
    {
        if ($this->request->getMethod() == "GET") {
            // Connect to database
            $model = $this->model('donhang');

            $getDoanhThu = $model->getThongTinDoanhThu();

            // Prepare Data
            $data = ['data' =>  $getDoanhThu];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }

    public function themTaiKhoan()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database



            $data = [
                "SDTTaiKhoan" => $this->request->input("SDTTaiKhoan"),
                "DiaChiGiaoHang" => $this->request->input("DiaChiGiaoHang"),
                "Ho" =>  $this->request->input("Ho"),
                "Ten" =>  $this->request->input("Ten"),
                "MatKhau" => md5($this->request->input("MatKhau")),
                "MaQuyenHan" =>  $this->request->input("MaQuyenHan"),

            ];
            $this->model("taikhoan")->createTaiKhoan($data);

            // Prepare Data
            $data = ['message' =>  "Add success"];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }

    public function themVoucher()
    {
        if ($this->request->getMethod() == "POST") {
            $isRandomVoucher = $this->request->input("isRandomVoucher");
            $isAllTaiKhoan = $this->request->input("isAllTaiKhoan");
            if ($isRandomVoucher) {
                $maVoucher = randomString("0123456789QWERTYUIOPASDGHJKLZXCVBNM", 7);
            } else {
                $maVoucher = $this->request->input("maVoucher");
            }
            if ($isAllTaiKhoan) {
                $danhSachTaiKhoan = $this->model("taikhoan")->getAllTaiKhoanAdmin();
                foreach ($danhSachTaiKhoan as $taiKhoan) {
                    $data = [
                        "SDTTaiKhoan" => $taiKhoan["SDTTaiKhoan"],
                        "MaVoucher" => $maVoucher,
                        "MaLoaiVoucher" =>  $this->request->input("maLoaiVoucher"),
                        "ThoiGianHetHan" =>  $this->request->input("thoiGianHetHan"),
                    ];
                    $this->model("voucher")->createVoucher($data);

                    if ($taiKhoan["NotificationToken"] != null) {
                        sendFCM($taiKhoan["NotificationToken"], "Notice about vouchers", "Client " . $taiKhoan["Ten"] . " Hey, you just got a new discount code");
                    }
                }
            } else {
                $data = [
                    "SDTTaiKhoan" => $this->request->input("sdtTaiKhoan"),
                    "MaVoucher" => $maVoucher,
                    "MaLoaiVoucher" =>  $this->request->input("maLoaiVoucher"),
                    "ThoiGianHetHan" =>  $this->request->input("thoiGianHetHan"),
                ];
                $this->model("voucher")->createVoucher($data);
                // send notification
                $getTaiKhoan = $this->model("taikhoan")->getTaiKhoan($this->request->input("sdtTaiKhoan"));
                if ($getTaiKhoan["NotificationToken"] != null) {
                    sendFCM($getTaiKhoan["NotificationToken"], "Notice about vouchers", "Client " . $getTaiKhoan["Ten"] . " Hey, you just got a new discount code");
                }
            }
            // Prepare Data
            $data = ['message' =>  "Add success"];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function themLoaiVoucher()
    {
        if ($this->request->getMethod() == "POST") {


            $data = [
                "TenLoaiVoucher" => $this->request->input("TenLoaiVoucher"),
                "MoTaLoaiVoucher" => $this->request->input("MoTaLoaiVoucher"),
                "HinhAnh" => $this->request->input("HinhAnh"),
                "TongTien" => $this->request->input("TongTien"),
                "PhiShip" => $this->request->input("PhiShip"),
                "SoLuongToiThieu" => $this->request->input("SoLuongToiThieu"),

            ];
            $this->model("loaivoucher")->createLoaiVoucher($data);
            $data = ['message' =>  "Add success"];
            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }



    public function capNhatSanPham()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('sanpham');
            $maSanPham = $this->request->input("maSanPham");
            $listTopping = $this->request->input("topping");
            $listKichThuoc = $this->request->input("kichThuoc");
            $data = [
                "TenSanPham" => $this->request->input("tenSanPham"),
                "HinhAnh" =>  $this->request->input("hinhAnh"),
                "MoTa" =>  $this->request->input("moTa"),
                "MaDanhMuc" =>  $this->request->input("maDanhMuc"),

            ];

            $model->capNhatSanPhamAdmin($data, "MaSanPham = '" . $maSanPham . "' ");
            $this->model("kichthuocsanpham")->xoaTatCaKichThuoc($maSanPham);
            foreach ($listKichThuoc as $kichThuoc) {
                $this->model("kichthuocsanpham")->createKichThuoc([
                    "MaSanPham" => $maSanPham,
                    "TenKichThuoc" => $kichThuoc["TenKichThuoc"],
                    "GiaTien" =>  $kichThuoc["GiaTien"]
                ]);
            }
            $this->model("toppingsanpham")->xoaTatCaTopping($maSanPham);

            foreach ($listTopping as $topping) {
                $this->model("toppingsanpham")->createTopping([
                    "MaSanPham" => $maSanPham,
                    "TenTopping" => $topping["TenTopping"],
                    "GiaTien" =>  $topping["GiaTien"]
                ]);
            }

            // Prepare Data
            $data = ['message' =>  "Update successful"];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }

    public function themSanPham()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('sanpham');

            $listTopping = $this->request->input("topping");
            $listKichThuoc = $this->request->input("kichThuoc");
            $data = [
                "TenSanPham" => $this->request->input("tenSanPham"),
                "HinhAnh" =>  $this->request->input("hinhAnh"),
                "MoTa" =>  $this->request->input("moTa"),
                "MaDanhMuc" =>  $this->request->input("maDanhMuc"),

            ];
            $maSanPham = $this->model("sanpham")->createSanPham($data);
            foreach ($listKichThuoc as $kichThuoc) {
                $this->model("kichthuocsanpham")->createKichThuoc([
                    "MaSanPham" => $maSanPham,
                    "TenKichThuoc" => $kichThuoc["TenKichThuoc"],
                    "GiaTien" =>  $kichThuoc["GiaTien"]
                ]);
            }
            foreach ($listTopping as $topping) {
                $this->model("toppingsanpham")->createTopping([
                    "MaSanPham" => $maSanPham,
                    "TenTopping" => $topping["TenTopping"],
                    "GiaTien" =>  $topping["GiaTien"]
                ]);
            }

            // Prepare Data
            $data = ['message' =>  "Add success"];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function xoaSanPham()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('sanpham');
            $maSanPham = $this->request->input("maSanPham");
            $this->model("kichthuocsanpham")->xoaTatCaKichThuoc($maSanPham);
            $this->model("toppingsanpham")->xoaTatCaTopping($maSanPham);
            $this->model("sanphamyeuthich")->xoaTatCa($maSanPham);
            $danhSachOrder = $this->model("lichsuorder")->getLichSuOrderByMaSanPham($maSanPham);
            foreach ($danhSachOrder as $order) {
                $this->model("lichsuordertopping")->deleteLichSuOrderTopping($order["MaLichSuOrder"]);
            }
            $this->model("sanpham")->xoaSanPham($maSanPham);
            // Prepare Data
            $data = ['message' =>  "Delete success"];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function huyDonHangDangCho()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('donhang');
            $maDonHang = $this->request->input("maDonHang");
            $tinhTrang = 4;
            $model->capNhatTinhTrang($maDonHang, $tinhTrang);

            $getDonHang = $model->getDH($maDonHang);
            $getTaiKhoan = $this->model("taikhoan")->getTaiKhoan($getDonHang["SDTTaiKhoan"]);
            $result = $model->sendNotification($getTaiKhoan["NotificationToken"], "Update on orders" . $getDonHang["MaDonHang"], "Your order has been cancelled");

            // Prepare Data
            $data = ['message' =>  "Update successful", 'data' => $result];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function xacNhanDonHangDangCho()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('donhang');
            $maDonHang = $this->request->input("maDonHang");
            $tinhTrang = 2;
            $model->capNhatTinhTrang($maDonHang, $tinhTrang);

            $getDonHang = $model->getDH($maDonHang);
            $getTaiKhoan = $this->model("taikhoan")->getTaiKhoan($getDonHang["SDTTaiKhoan"]);
            $result =  $model->sendNotification($getTaiKhoan["NotificationToken"], "Update on orders" . $getDonHang["MaDonHang"], "Your order has been successfully confirmed and is on its way to you");


            // Prepare Data
            $data = ['message' =>  "Update successful", 'data' => $result];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function hoanTatDonHangDangGiao()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('donhang');
            $maDonHang = $this->request->input("maDonHang");
            $tinhTrang = 3;
            $model->capNhatTinhTrang($maDonHang, $tinhTrang);

            $getDonHang = $model->getDH($maDonHang);
            $getTaiKhoan = $this->model("taikhoan")->getTaiKhoan($getDonHang["SDTTaiKhoan"]);
            $result =  $model->sendNotification($getTaiKhoan["NotificationToken"], "Update on orders" . $getDonHang["MaDonHang"], "Your order has been delivered successfully");
            // Prepare Data
            $data = ['message' =>  "Update successful", 'data' => $result];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function getDonHangDangGiao()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('donhang');

            $danhSachDonHang = $model->getAllDHDangGiaoAdmin();
            foreach ($danhSachDonHang as &$donHang) {
                $lichSuOrderList = $this->model("lichsuorder")->getLichSuOrder($donHang["MaDonHang"]);

                $lichSuOrderToppingList = $this->model("lichsuorder")->getLichSuOrderTopping($donHang["MaDonHang"]);


                foreach ($lichSuOrderList as &$lichSuOrder) {
                    $arrayTopping = array();
                    $p = 0;
                    foreach ($lichSuOrderToppingList as $lichSuOrderTopping) {
                        if ($lichSuOrder["MaLichSuOrder"] == $lichSuOrderTopping["MaLichSuOrder"]) {
                            array_push($arrayTopping, $lichSuOrderTopping);
                            array_splice($lichSuOrderToppingList, $p, 1);
                            $p--;
                        }
                        $p++;
                    }

                    $lichSuOrder["Topping"] =  $arrayTopping;
                }
                $donHang["lichSuOrder"] = $lichSuOrderList;
            }


            // Prepare Data
            $data = ['data' =>  $danhSachDonHang];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function getDonHangDaHuy()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('donhang');

            $danhSachDonHang = $model->getAllDHDaHuyAdmin();
            foreach ($danhSachDonHang as &$donHang) {
                $lichSuOrderList = $this->model("lichsuorder")->getLichSuOrder($donHang["MaDonHang"]);

                $lichSuOrderToppingList = $this->model("lichsuorder")->getLichSuOrderTopping($donHang["MaDonHang"]);


                foreach ($lichSuOrderList as &$lichSuOrder) {
                    $arrayTopping = array();
                    $p = 0;
                    foreach ($lichSuOrderToppingList as $lichSuOrderTopping) {
                        if ($lichSuOrder["MaLichSuOrder"] == $lichSuOrderTopping["MaLichSuOrder"]) {
                            array_push($arrayTopping, $lichSuOrderTopping);
                            array_splice($lichSuOrderToppingList, $p, 1);
                            $p--;
                        }
                        $p++;
                    }

                    $lichSuOrder["Topping"] =  $arrayTopping;
                }
                $donHang["lichSuOrder"] = $lichSuOrderList;
            }


            // Prepare Data
            $data = ['data' =>  $danhSachDonHang];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
    public function getDonHangDaHoanThanh()
    {
        if ($this->request->getMethod() == "POST") {
            // Connect to database
            $model = $this->model('donhang');

            $danhSachDonHang = $model->getAllDHDaHoanThanhAdmin();
            foreach ($danhSachDonHang as &$donHang) {
                $lichSuOrderList = $this->model("lichsuorder")->getLichSuOrder($donHang["MaDonHang"]);

                $lichSuOrderToppingList = $this->model("lichsuorder")->getLichSuOrderTopping($donHang["MaDonHang"]);


                foreach ($lichSuOrderList as &$lichSuOrder) {
                    $arrayTopping = array();
                    $p = 0;
                    foreach ($lichSuOrderToppingList as $lichSuOrderTopping) {
                        if ($lichSuOrder["MaLichSuOrder"] == $lichSuOrderTopping["MaLichSuOrder"]) {
                            array_push($arrayTopping, $lichSuOrderTopping);
                            array_splice($lichSuOrderToppingList, $p, 1);
                            $p--;
                        }
                        $p++;
                    }

                    $lichSuOrder["Topping"] =  $arrayTopping;
                }
                $donHang["lichSuOrder"] = $lichSuOrderList;
            }


            // Prepare Data
            $data = ['data' =>  $danhSachDonHang];

            // Send Response
            $this->response->sendStatus(200);
            $this->response->setContent($data);
        }
    }
}
