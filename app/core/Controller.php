<?php

class Controller
{

    public $token;
    public function view($view, $data = [])
    {

        require_once('../app/views/' . $view . '.php');
    }

    public function model($model)
    {

        require_once('../app/models/' . $model . '.php');
        return new $model;
    }
}
