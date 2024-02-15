role Admin
role SuperAdmin
role Merchant
resource Inventory
resource Onboarding
resource Cases
action hide 
action update
action delete
action view 
action search
inrole role(Admin, Merchant)
priv permission(role.Admin, resource.Onboarding, hide)
priv permission(role.Admin, resource.Onboarding, view)

priv permission(role.SuperAdmin, resource.Onboarding, view)
priv permission(role.SuperAdmin, resource.Onboarding, update)
priv permission(role.SuperAdmin, resource.Cases, update)
priv permission(role.SuperAdmin, resource.Cases, view)

priv permission(role.Merchant, resource.Inventory, delete)
priv permission(role.Merchant, resource.Onboarding, search)




