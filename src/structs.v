module version

pub struct Semver {
pub:
  major       int
  minor       int
  patch       int
}

pub struct Decver {
pub:
  major       int
  minor       int
}

pub type ReturnValue = Semver | Decver

pub struct Return {
pub:
  value       ReturnValue
  type        string
}
