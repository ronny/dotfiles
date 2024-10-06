if command -q kubectl
  alias ks="kubectl --context staging"
  alias kpre="kubectl --context preprod"
  alias kp="kubectl --context prod"
  alias kpus="kubectl --context prod-us"
end
