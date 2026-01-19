module version

pub fn (versions []Return) sort_newest() ![]Return {
  if versions.len == 0 {
    return []Return{}
  }

  // Determine type of the first element
  first_type := versions[0].type

  // Verify all elements are of the same type
  for ver in versions {
    if ver.type != first_type {
      return error('Mixed version types detected: $first_type and $ver.type')
    }
  }

  mut sorted := versions.clone() // copy to avoid modifying original slice

  match first_type {
    'semver' {
      // Sort semvers: newest first
      sorted.sort_with_compare(fn (a &Return, b &Return) int {
        sa := a.value as Semver
        sb := b.value as Semver
        if sa.major != sb.major { return sb.major - sa.major }
        if sa.minor != sb.minor { return sb.minor - sa.minor }
        return sb.patch - sa.patch
      })
    }
    'decver' {
      // Sort decvers: newest first
      sorted.sort_with_compare(fn (a &Return, b &Return) int {
        da := a.value as Decver
        db := b.value as Decver
        if da.major != db.major { return db.major - da.major }
        return db.minor - da.minor
      })
    }
    else {
      return error('Invalid version type: $first_type')
    }
  }

  return sorted
}
