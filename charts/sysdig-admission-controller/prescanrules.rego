##############################
# Pre-Scan rules
##############################

valid_policy_values := ["accept", "reject", "check-scan", "scan"]

# Configuration errros

config_error["ContainerObject.image is missing in input"] {
        not input.ContainerObject.image
}

# Final decision

image := input.ContainerObject.image

image_action_trigger_scan {
        imagePolicy = {"ns": _, "prefix": _, "action": "scan"}
}

image_action_check_scan {
        imagePolicy = {"ns": _, "prefix": _, "action": "check-scan"}
}

no_denied_image {
        deny_reasons := { reason | deny_image[reason] }
        count(deny_reasons) == 0
}

scan_image {
        image_action_trigger_scan
        not image_action_check_scan
        no_denied_image
}

allow_image {
        not image_action_trigger_scan
        not image_action_check_scan
        no_denied_image
}

deny_image[msg] {
        image_action_reject[[ns, prefix]]
        msg :=  sprintf("REJECTED. %s", [scope_str(ns, prefix)])
}
