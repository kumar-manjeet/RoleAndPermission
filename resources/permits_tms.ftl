role Admin
role Hr
role Owner
resource Inventory
resource Onboarding
resource Cases
action hide 
action update
action delete
action view 
action search

inrole role(Admin, Hr)

priv permission(role.Admin, resource.Onboarding, hide)
priv permission(role.Admin, resource.Onboarding, view)

priv permission(role.Hr, resource.Onboarding, view)
priv permission(role.Hr, resource.Onboarding, update)
priv permission(role.Hr, resource.Cases, update)
priv permission(role.Hr, resource.Cases, view)

priv permission(role.Owner, resource.Inventory, delete)
priv permission(role.Owner, resource.Onboarding, search)