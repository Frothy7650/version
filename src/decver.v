module version

import regex

pub fn decver(ver_string string) !ReturnValue {
  mut re := regex.regex_opt(r"^(\d+)\.(\d+)$")!
  start, _ := re.match_string(ver_string)
  if start < 0 {
    return error("Invalid semver")
  }

  major := re.get_group_by_id(ver_string, 0).int()
  minor := re.get_group_by_id(ver_string, 1).int()

  return Decver{
    major: major
    minor: minor
  }
}
