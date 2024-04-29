<?php

use MVC\Controller;

class ControllersTaiKhoan extends Controller
{

    public function index()
    {

        // Connect to database
        $model = $this->model('taikhoan');

        // Read All Task
        $taiKhoan = $model->getAllTaiKhoan();

        // Prepare Data
        $data = ['data' => $taiKhoan];

        // Send Response
        $this->response->sendStatus(200);
        $this->response->setContent($data);
    }

    public function createTaiKhoan()
    {
        try {


            if ($this->request->getMethod() == "POST") {
                // Connect to database
                $model = $this->model('taikhoan');


                $soDienThoai = $this->request->input("SDTTaiKhoan");
                $matKhau = $this->request->input("MatKhau");
                $ho = $this->request->input("Ho");
                $ten = $this->request->input("Ten");
                if (empty($soDienThoai) || empty($matKhau) || empty($ho) || empty($ten)) {
                    $data = ['status' => "fail", 'message' => 'Please enter complete information'];
                    // Send Response
                    $this->response->sendStatus(400);
                    $this->response->setContent($data);
                    return;
                }
                if ($model->checkSDTTaiKhoan($soDienThoai) > 0) {
                    $data = ['status' => "fail", 'message' => 'The phone number is registered to another account'];
                    $this->response->sendStatus(400);
                    $this->response->setContent($data);
                    return;
                }
                $users = $model->createTaiKhoan([
                    "SDTTaiKhoan" => $soDienThoai,
                    "MatKhau" => md5($matKhau),
                    "Ho" => $ho,
                    "Ten" => $ten
                ]);
                $data = ['status' => "success", 'message' => 'Account registration successful'];
                $this->response->sendStatus(200);
                $this->response->setContent($data);
            }
        } catch (Exception $err) {
            $data = ['status' => "error", 'message' => $err->getMessage()];
            $this->response->sendStatus(404);
            $this->response->setContent($data);
        }
    }
    public function getThongTinTaiKhoan()
    {
        try {

            if ($this->request->getMethod() == "POST") {
                $model = $this->model('taikhoan');
                $soDienThoai = $this->request->input("SDTTaiKhoan");
                $users = $model->getThongTin($soDienThoai);
                $data = ['status' => "success", 'data' => $users];
                $this->response->sendStatus(200);
                $this->response->setContent($data);
            }
        } catch (Exception $err) {
            $data = ['status' => "error", 'message' => $err->getMessage()];
            $this->response->sendStatus(404);
            $this->response->setContent($data);
        }
    }
    public function updateThongTinTaiKhoan()
    {
        try {

            if ($this->request->getMethod() == "POST") {
                $model = $this->model('taikhoan');
                $soDienThoai = $this->request->input("SDTTaiKhoan");
                $ho = $this->request->input("Ho");
                $ten = $this->request->input("Ten");
                $diaChiGiaoHang = $this->request->input("DiaChiGiaoHang");
                $users = $model->updateThongTin([
                    'Ho' => $ho,
                    'Ten' => $ten,
                    'DiaChiGiaoHang' => $diaChiGiaoHang,

                ], "SDTTaiKhoan = '" . $soDienThoai . "' ");
                $users = $model->getThongTin($soDienThoai);

                $data = ['status' => "success", 'data' => $users, 'message' => "Update successful"];
                $this->response->sendStatus(200);
                $this->response->setContent($data);
            }
        } catch (Exception $err) {
            $data = ['status' => "error", 'message' => $err->getMessage()];
            $this->response->sendStatus(404);
            $this->response->setContent($data);
        }
    }
    public function updateMatKhauTaiKhoan()
    {
        try {

            if ($this->request->getMethod() == "POST") {
                $model = $this->model('taikhoan');
                $soDienThoai = $this->request->input("SDTTaiKhoan");
                $matKhauCu = $this->request->input("MatKhauCu");
                $matKhauMoi = $this->request->input("MatKhauMoi");

                // check mat khau trung nhau
                if ($matKhauCu == $matKhauMoi) {
                    $data = ['status' => "fail", 'message' => 'The two passwords cannot be the same'];
                    // Send Response
                    $this->response->sendStatus(400);
                    $this->response->setContent($data);
                    return;
                }
                /// check mat khau cu
                if (!$model->checkLoginTaiKhoan($soDienThoai, $matKhauCu)) {
                    $data = ['status' => "fail", 'message' => 'The old password is incorrect'];
                    // Send Response
                    $this->response->sendStatus(400);
                    $this->response->setContent($data);
                    return;
                }
                // cap nhat mat khau
                $model->capNhatMatKhau($soDienThoai, $matKhauMoi);

                $data = ['status' => "success", 'message' => "Update successful"];
                $this->response->sendStatus(200);
                $this->response->setContent($data);
            }
        } catch (Exception $err) {
            $data = ['status' => "error", 'message' => $err->getMessage()];
            $this->response->sendStatus(404);
            $this->response->setContent($data);
        }
    }
    public function updateNotificationToken()
    {
        try {

            if ($this->request->getMethod() == "POST") {
                $model = $this->model('taikhoan');
                $soDienThoai = $this->request->input("SDTTaiKhoan");
                $token = $this->request->input("Token");
                // cap nhat token
                $model->capNhatNotificationToken($soDienThoai, $token);

                $data = ['status' => "success", 'message' => "Update successful"];
                $this->response->sendStatus(200);
                $this->response->setContent($data);
            }
        } catch (Exception $err) {
            $data = ['status' => "error", 'message' => $err->getMessage()];
            $this->response->sendStatus(404);
            $this->response->setContent($data);
        }
    }
    public function loginTaiKhoan()
    {
        try {


            if ($this->request->getMethod() == "POST") {
                // Connect to database
                $model = $this->model('taikhoan');


                $soDienThoai = $this->request->input("SDTTaiKhoan");
                $matKhau = $this->request->input("MatKhau");

                if (empty($soDienThoai) || empty($matKhau)) {
                    $data = ['status' => "fail", 'message' => 'Please enter complete information'];
                    // Send Response
                    $this->response->sendStatus(400);
                    $this->response->setContent($data);
                    return;
                }
                if ($model->checkSDTTaiKhoan($soDienThoai) == 0) {
                    $data = ['status' => "fail", 'message' => 'Phone number is not registered'];
                    $this->response->sendStatus(400);
                    $this->response->setContent($data);
                    return;
                }
                if ($model->checkLoginTaiKhoan($soDienThoai, $matKhau) == false) {
                    $data = ['status' => "fail", 'message' => 'Incorrect phone number or password'];
                    $this->response->sendStatus(400);
                    $this->response->setContent($data);
                    return;
                }
                $user = $model->getThongTin($soDienThoai);
                $data = ['status' => "success", 'message' => 'Log in successfully', 'data' => $user];
                $this->response->sendStatus(200);
                $this->response->setContent($data);
            }
        } catch (Exception $err) {
            $data = ['status' => "error", 'message' => $err->getMessage()];
            $this->response->sendStatus(404);
            $this->response->setContent($data);
        }
    }
}
