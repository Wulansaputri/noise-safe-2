<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    use HasFactory;

    protected $table = 'purchase';
    protected $primaryKey = 'purchase_id';
    public $timestamps = false;

    protected $fillable = [
        'device_id',
        'user_id',
        'transaction_date',
        'transaction_status',
        'created_at',
    ];
}
