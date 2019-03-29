# Powershell

Carpeta con ejemplos de scripts para Active Directory
Folder with examples for Active Directory

ChangeAdPassword -> Cambia la contraseña de usuarios de Ad
                    Change AD users passwords

ChangeNotesInGroups ->  Cambia el campo notas en los grupos que respeten el filtro
                        Change the notes field in all the gruops which passed the filter

Editbymail          -> This script shows how to modify entries in AD by email address
                       Este script muestra como modificar entradas en el ad mediante email 

GetAdminUsers ->    Get a list of the domain admins and if are enabled or not, and report                     it by mail

GetAllObjectsFromADPath ->  Obtiene todos los objetos del AD dentro de la carpeta de AD                               indicada
                            Get all the objects within the AD path indicated

GetUOsFromUser ->   Obtiene las OUs de las que un usuario dado es miembro
                    Get the OUs from where an user given is member

GetUsersFromRemoteDomain -> Obtiene todos los usuarios de un grupo de un dominio remoto
                            Get all user from a specified group in a remote domain

GetUsersOfGroups -> Obtiene todos los usuarios de un grupo recursivamente
                    Get all the users within a list of groups recursivelly

Insert in groups -> Inserta el usuario especificado en los grupos del AD previamente
                    filtrados
                    Insert within the groups filtered, the user specified
  
MembersCleaner -> Elimina a todos los usuarios de una ruta de AD de todos los grupos de
                  los que son miembros
                  Take all the user within a AD path and remove all group which they are
                  members of
                  
RemoveGroupMemebers ->  Elimina los usuarios dados de un grupo
                        Remove the users given from a group
                        
UpdateADExpirationDate ->   Actuliza la fechade expiracion de cuentas de AD de un conjunto
                            de usuarios
                            Update the AD account expiration date from a list of users
                            given 
                            
                  
UsersEnabled ->     Dado un listado de usuarios desde un csv, los busca en el Ad. Eporta 2
                    csv; Uno: Indica Nombre,Logonname,Enabled. Otro: Usuarios no encontrados.
                    Given a list of user, search them in AD.Export 2 csv; One: Filled with
                    Name,Logonname,Enabled. Other: Users not founded.

UsersFrom1Manager ->    Devuelve todos los usuarios que tienen como manager el usuario
                        dado.
                        Return all the users which have as manager the user requested
                        
                        
                        