#include <ffi_platypus_bundle.h>
#include <stdio.h>

typedef struct {
  uint8_t r, b, g;
} color_t;

color_t *
color__new(const char *class, uint8_t r, uint8_t g, uint8_t b)
{
  color_t *self = malloc( sizeof( color_t ) );
  self->r = r;
  self->b = b;
  self->g = g;
  return self;
}

uint8_t
color__get_red(color_t *self)
{
  return self->r;
}

uint8_t
color__get_green(color_t *self)
{
  return self->g;
}

uint8_t
color__get_blue(color_t *self)
{
  return self->b;
}

void
color__set_red(color_t *self, uint8_t r)
{
  self->r = r;
}

void
color__set_green(color_t *self, uint8_t g)
{
  self->g = g;
}

void
color__set_blue(color_t *self, uint8_t b)
{
  self->b = b;
}

const char *
color__to_string(color_t *self)
{
  static char buffer[20];
  snprintf(buffer, 20, "[ %02x, %02x, %02x ]", self->r, self->g, self->b);
  return buffer;
}

void
color__DESTROY(color_t *self)
{
  free(self);
}
