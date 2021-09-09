from django.db import models
from django.contrib.auth.models import User
from phonenumber_field.modelfields import PhoneNumberField
from products.models import DiscountCode


class Customer(User):
    phone = PhoneNumberField(unique=True, null=False, blank=False)
    image = models.ImageField(upload_to="customers_image", blank=True, null=True)
    discount = models.OneToOneField(DiscountCode, on_delete=models.SET_NULL, blank=True, null=True)

    def __str__(self):
        return self.first_name + " " + self.last_name

    class Meta:
        verbose_name_plural = 'Customers'


class Address(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=False, null=False)
    address = models.CharField(max_length=1000, blank=False, null=False)

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name_plural = 'Addresses'
