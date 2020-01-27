terraform {
  backend "remote" {
    organization = "phil-test"
    token = "WTBi9oUzokQUEw.atlasv1.UOgk2q1YFvFLzYIvTyJYokK24DBE8cXqB3oCd2FfzCgWDWQ2KJkVaIzG6jSMcvhCoFs"
    workspaces {
      name = "iap-test"
    }
  }
}


provider "google" {
}

resource "google_iap_web_iam_binding" "editor" {
  project = "p-teckresources-tfe"
  role = "roles/iap.httpsResourceAccessor"
  members = [
    "user:phil@teck.dev",
  ]
}
