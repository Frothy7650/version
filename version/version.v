module version

import regex

pub fn build(ver string) !Return {
  // I do not like regex
  if regex.regex_opt(r"^(\d+)\.(\d+)\.(\d+)$")!.matches_string(ver) {
    return Return {
      value: semver(ver)!
      type: "semver"
    }
  } else if regex.regex_opt(r"^(\d+)\.(\d+)$")!.matches_string(ver) {
    return Return {
      value: decver(ver)!
      type: "decver"
    }
  }
  return error("Not a valid version type")
}
