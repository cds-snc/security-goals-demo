workflow "Run checks" {
  on = "schedule(0 0 * * *)"
  resolves = ["docker://gcr.io/security-goals/run-start"]
}

action "docker://gcr.io/security-goals/run-start" {
  uses = "docker://gcr.io/security-goals/run-start"
  env = {
    URL = "https://security-goals-demo.cdssandbox.xyz/runner/run_security_posture"
  }
}
