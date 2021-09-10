from django.db import models
from django.contrib.auth.models import User
from phonenumber_field.modelfields import PhoneNumberField


class Customer(User):
    phone = PhoneNumberField(unique=True, null=False, blank=False)
    image = models.ImageField(upload_to="customers_image", blank=True, null=True)

    MALE = False
    FEMALE = True
    gender_type = (
        (MALE, "male"),
        (FEMALE, "female")
    )
    gender = models.BooleanField(default=True, choices=gender_type, null=False, blank=False)

    def __str__(self):
        return self.username

    class Meta:
        verbose_name_plural = 'Customers'


class Address(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=False, null=False)
    address = models.CharField(max_length=1000, blank=False, null=False)

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name_plural = 'Addresses'


class DiscountCode(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=True, null=True)
    code = models.CharField(max_length=10)
    amount = models.FloatField()
    start_date = models.DateTimeField()
    expire_date = models.DateTimeField()

    def __str__(self):
        return self.amount + "%"
