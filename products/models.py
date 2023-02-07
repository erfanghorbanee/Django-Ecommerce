from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from django.shortcuts import reverse
from django.utils.text import slugify


class Category(models.Model):
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = "Categories"


class ProductImage(models.Model):
    name = models.CharField(max_length=100)
    image = models.ImageField(upload_to="static/img/products_image")

    def __str__(self):
        return self.name


class Product(models.Model):
    title = models.CharField(max_length=100, unique=True)
    price = models.PositiveIntegerField()
    description = models.TextField(max_length=5000)
    seller = models.CharField(max_length=200, blank=True, null=True)
    rate = models.PositiveIntegerField(
        default=0, validators=[MaxValueValidator(5), MinValueValidator(0)]
    )
    count = models.PositiveIntegerField(blank=True, null=True)
    image = models.ManyToManyField(ProductImage)

    UNAVAILABLE = False
    AVAILABLE = True
    status_type = ((UNAVAILABLE, "unavailable"), (AVAILABLE, "available"))
    status = models.BooleanField(default=True, choices=status_type)

    category = models.ForeignKey(
        Category, on_delete=models.CASCADE, related_name="products"
    )

    slug = models.SlugField(max_length=100, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        return super().save(*args, **kwargs)

    def __str__(self):
        return self.title
