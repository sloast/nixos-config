{config, ...}: {

  home.file.".local/bin" = {
    source = ./bin;
    target = ".local/bin";
    recursive = true;
  };
}
