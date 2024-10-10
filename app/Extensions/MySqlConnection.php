<?php

namespace App\Extensions;

use Illuminate\Database\MySqlConnection as BaseMySqlConnection;

class MySqlConnection extends BaseMySqlConnection
{
    public function isDoctrineAvailable()
    {
        return class_exists('Doctrine\DBAL\Driver\PDOMySql\Driver');
    }
}