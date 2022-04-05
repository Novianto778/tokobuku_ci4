<?php

namespace App\Entities;

use CodeIgniter\Entity\Entity;

class DistributorEntity extends Entity
{
    protected $datamap = [];
    protected $dates   = ['created_at', 'updated_at', 'deleted_at'];
    protected $casts   = [];

    function setEmail(string $email)
    {
        $this->attributes["email"] = strtolower($email);
        return $this;
    }

    public function getName()
    {
        return strtoupper($this->attributes['name']);
    }
}
