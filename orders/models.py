from django.db import models
from customers.models import Customer
from products.models import Product


class OrderProduct(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=False, null=False)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)

    def __str__(self):
        return f"{self.quantity} of {self.product.title}"


class Order(models.Model):
    # Cart model
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=False, null=False)
    ref_code = models.CharField(max_length=10, blank=True, null=True)
    products = models.ManyToManyField(OrderProduct)
    ordered_date = models.DateTimeField()
    being_delivered = models.BooleanField(default=False)
    received = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.user.username}: {self.ref_code}"
