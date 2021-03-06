/*
  IAM Policy
*/

resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = "${file("policy.json")}"
}