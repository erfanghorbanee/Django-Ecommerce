from django.conf import settings
from django.db import models
from django.utils import timezone

from customers.models import Address
from products.models import Product


class OrderItem(models.Model):
    item = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)

    def __str__(self):
        return f"{self.quantity} of {self.item.title}"


class Order(models.Model):
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, null=True
    )
    products = models.ManyToManyField(OrderItem)
    total_price = models.PositiveIntegerField()
    order_date = models.DateTimeField(blank=True, null=True, default=timezone.now)
    ref_code = models.CharField(max_length=10, blank=True, null=True)
    address = models.ForeignKey(Address, on_delete=models.CASCADE)

    READY_TO_DELIVER = "آماده ارسال"
    DELIVERING = "فرستاده شد"
    DELIVERED = "دریافت شد"
    status_type = [
        (READY_TO_DELIVER, "آماده ارسال"),
        (DELIVERING, "فرستاده شد"),
        (DELIVERED, "دریافت شد"),
    ]
    delivery_status = models.CharField(
        max_length=20,
        choices=status_type,
        default=READY_TO_DELIVER,
    )

    def __str__(self):
        return f"{self.user} | {self.ref_code}"
