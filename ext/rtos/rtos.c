#include <ruby.h>
#include <unistd.h>

static
VALUE initialize(VALUE self)
{
    return self;
}

static
VALUE delay_rt(VALUE c, VALUE t)
{
    usleep(NUM2DBL(t)*1000000);
    return Qnil;
}

static
VALUE preempt_rt(VALUE c)
{
  rb_need_block();
  rb_yield(Qnil);
  return Qnil;
}

void Init_rtos(void)
{
  VALUE cRtos = rb_define_module("Rtos");

  rb_define_method(cRtos, "initialize", initialize, 0);
  rb_define_method(cRtos, "preempt_rt", preempt_rt, 0);
  rb_define_method(cRtos, "delay_rt", delay_rt, 1);
}
