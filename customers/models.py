from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _

from .managers import CustomUserManager


class Customer(AbstractUser):
    username = None
    email = models.EmailField(_('email address'), unique=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    phone = PhoneNumberField(null=False, blank=False)

    MALE = False
    FEMALE = True
    gender_type = (
        (MALE, "مرد"),
        (FEMALE, "زن")
    )
    gender = models.BooleanField(default=True, choices=gender_type, null=False, blank=False)

    def __str__(self):
        return self.email


class Address(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=False, null=False)
    address = models.CharField(max_length=1200, blank=False, null=False)
    postcode = models.CharField(max_length=12)

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name_plural = 'Addresses'


class DiscountCode(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=True, null=True)
    code = models.CharField(max_length=10, unique=True)
    amount = models.PositiveIntegerField()
    start_date = models.DateTimeField()
    expire_date = models.DateTimeField()

    def __str__(self):
        return str(self.amount) + '%'
