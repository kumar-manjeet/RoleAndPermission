role FrontendDeveloper
role BackendDeveloper
role FullStackDeveloper
resource Frontend
resource Backend
resource Api
action hide 
action update
action delete
action view 
action search
inrole role(FrontendDeveloper, FullStackDeveloper)
priv permission(role.FrontendDeveloper, resource.Frontend, hide)
priv permission(role.FrontendDeveloper, resource.Frontend, view)

priv permission(role.BackendDeveloper, resource.Backend, view)
priv permission(role.BackendDeveloper, resource.Backend, update)
priv permission(role.BackendDeveloper, resource.Api, update)
priv permission(role.BackendDeveloper, resource.Api, view)

priv permission(role.FullStackDeveloper, resource.Backend, delete)
priv permission(role.FullStackDeveloper, resource.Api, search)




