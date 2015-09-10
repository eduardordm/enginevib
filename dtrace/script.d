ruby*:::object-create
{
  @objects[copyinstr(arg0)] = count();
}

ruby*:::method-entry
{
  @objects[copyinstr(arg1)] = count();
}

ruby*:::cmethod-entry
{
  @objects[copyinstr(arg1)] = count();
}
