<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;
    protected $table = 'order_detail';
    protected $primaryKey = 'id';
    protected $fillable = [
        'order_id',
        'product_id',
        'price', // price * promotion
        'quantity',
    ];
    public $incrementing = true;
    public $timestamps = true;
}
