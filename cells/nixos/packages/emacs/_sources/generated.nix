# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  GodTian_Pinyin = {
    pname = "GodTian_Pinyin";
    version = "e21e41510b6d440389966bb0b2a70b38fafc6741";
    src = fetchFromGitHub {
      owner = "whatbeg";
      repo = "GodTian_Pinyin";
      rev = "e21e41510b6d440389966bb0b2a70b38fafc6741";
      fetchSubmodules = false;
      sha256 = "sha256-uSrj+hwai7fSJN7SWL5u80hp8nSzJ4XI5t/8s19uoV8=";
    };
    date = "2017-07-19";
  };
  acm-terminal = {
    pname = "acm-terminal";
    version = "0dbbd7f401da1bedd1a9146df6127233d601435b";
    src = fetchFromGitHub {
      owner = "twlz0ne";
      repo = "acm-terminal";
      rev = "0dbbd7f401da1bedd1a9146df6127233d601435b";
      fetchSubmodules = false;
      sha256 = "sha256-Opouy9A6z0YUT1zxZq1yHx+r/hwNE93JDwfa1fMWNgc=";
    };
    date = "2023-06-01";
  };
  jinx = {
    pname = "jinx";
    version = "fcfc696c30b2ccc8967f576091c9706377b24fdc";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "jinx";
      rev = "fcfc696c30b2ccc8967f576091c9706377b24fdc";
      fetchSubmodules = false;
      sha256 = "sha256-8/LkPH/UWOJRmd4A4ooMCjiVu6ol9RsLm971OegbcNA=";
    };
    date = "2023-05-27";
  };
  lsp-bridge = {
    pname = "lsp-bridge";
    version = "d844a65c606d5d32b7945bd5ef6b3dd2c506f0dc";
    src = fetchFromGitHub {
      owner = "manateelazycat";
      repo = "lsp-bridge";
      rev = "d844a65c606d5d32b7945bd5ef6b3dd2c506f0dc";
      fetchSubmodules = false;
      sha256 = "sha256-hxAXJR5MmPn47Csm7NRAJT548ZJuqIEs/SdJYI4Ipjs=";
    };
    date = "2023-06-03";
  };
}
