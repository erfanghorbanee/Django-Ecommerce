from django.db import models
from django.shortcuts import reverse
from django.core.validators import MaxValueValidator, MinValueValidator


class Category(models.Model):
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = 'Categories'


class Product(models.Model):
    title = models.CharField(max_length=200, blank=False, null=False)
    price = models.FloatField(blank=False, null=False)
    description = models.TextField(max_length=5000, blank=False, null=False)
    image = models.ImageField(upload_to="products_image", blank=False, null=False)
    rate = models.PositiveIntegerField(default=0, validators=[MaxValueValidator(5), MinValueValidator(0)])
    counts = models.PositiveIntegerField()

    UNAVAILABLE = False
    AVAILABLE = True
    status_type = (
        (UNAVAILABLE, "unavailable"),
        (AVAILABLE, "available")
    )
    status = models.BooleanField(default=True, choices=status_type, blank=False, null=False)

    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products', blank=False, null=False)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("products:product-detail", kwargs={'id': self.id})


class DiscountCode(models.Model):
    code = models.CharField(max_length=10)
    amount = models.FloatField()
    start_date = models.DateTimeField()
    expire_date = models.DateTimeField()

    def __str__(self):
        return "%" + self.amount

