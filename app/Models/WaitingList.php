<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WaitingList extends Model
{
    use HasFactory;

    protected $table = 'waiting_list';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'package',
        'message',
        'status'
    ];

    protected $attributes = [
        'status' => 'waiting'
    ];
}