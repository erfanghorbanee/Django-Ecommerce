from django.db import models
from customers.models import Customer, Address
from products.models import Product


class Order(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True)
    address = models.ForeignKey(Address, on_delete=models.SET_NULL, null=True)
    products = models.ManyToManyField(Product)
    ref_code = models.CharField(max_length=10, blank=True, null=True)
    total_price = models.PositiveIntegerField()

    READY_TO_DELIVER = 'ready_to_deliver'
    DELIVERING = 'delivering'
    DELIVERED = 'delivered'
    status_type = [
        (READY_TO_DELIVER, 'ready_to_deliver'),
        (DELIVERING, 'delivering'),
        (DELIVERED, 'delivered'),
    ]
    status = models.CharField(
        max_length=20,
        choices=status_type,
        default=READY_TO_DELIVER,
    )

    def __str__(self):
        return f"{self.user.username}"


class OrderHistory(models.Model):
    order = models.OneToOneField(Order, on_delete=models.CASCADE)
    ordered_date = models.DateTimeField(blank=True, null=True)
    delivered_date = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return f"{self.user.username}"
