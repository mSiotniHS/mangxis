import uuid

from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.translation import gettext_lazy as _


class UUIDMixin(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)

    class Meta:
        abstract = True


class User(UUIDMixin, AbstractUser):
    language = models.CharField(max_length=5)

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')

