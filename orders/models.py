from django.db import models
from customers.models import Customer
from products.models import Product


class Order(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=False, null=False)
    code = models.CharField(max_length=15, blank=True, null=True)
    items = models.ManyToManyField(Product)
    ordered_date = models.DateTimeField()

    def __str__(self):
        return self.user.username


class OrderHistory(models.Model):
    order = models.OneToOneField(Order, on_delete=models.CASCADE, blank=False, null=False)
    being_delivered = models.BooleanField(default=False)
    received = models.BooleanField(default=False)

    def __str__(self):
        return self.order.code

    class Meta:
        verbose_name_plural = 'Order histories'
