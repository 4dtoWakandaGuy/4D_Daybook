//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME DBNavigation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(IME_at_Function;0)
	//ARRAY TEXT(IME_at_FunctionAccess;0)
	//ARRAY TEXT(IME_at_FunctionCode;0)
	//ARRAY TEXT(IME_at_FunctionName;0)
	//ARRAY TEXT(ME_at_FunctionAccess;0)
	C_LONGINT:C283($_l_Paramters)
	C_TEXT:C284($_t_CurrentPage; $_t_NavDefinitions; $_t_oldMethodName; $_t_Output; $0; $1; IME_t_UserGroupCode; IME_t_UserInitials; IME_t_UserName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME DBNavigation")
//IME DBNavigation
//Rollo 9/6/2004

//return the menus, or navigation area, on the left of the daybook interface


$_l_Paramters:=Count parameters:C259

If ($_l_Paramters>0)
	$_t_CurrentPage:=$1  //URL of the current page, may be used to affect the Navigation
End if 

If (IME_t_UserName#"")
	
	$_t_Output:="<A HREF="+IME_DBEncrypt("DBDashboard")+">My dashboard</A><BR>"
	$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBLogout")+">Log out</A><BR><BR>"
	
	If (False:C215)
		
		//Read arrays from Cache
		
		
		
		//Find and interpret the definitions
		$_t_NavDefinitions:=IME_Text2("ITX DBNavigation"+IME_t_UserInitials)  //specific to the Person
		If ($_t_NavDefinitions="")
			$_t_NavDefinitions:=IME_Text2("ITX DBNavigation_"+IME_t_UserGroupCode)  //specific to the Personel Group
			If ($_t_NavDefinitions="")
				
				$_t_NavDefinitions:=IME_Text2("ITX DBNavigation")  //the default for this table
				
				If ($_t_NavDefinitions#"")
					
					READ WRITE:C146([SCRIPTS:80])
					DUPLICATE RECORD:C225([SCRIPTS:80])
					[SCRIPTS:80]Script_Code:1:="ITX DBNav"+IME_t_UserInitials
					[SCRIPTS:80]Script_Name:2:=[SCRIPTS:80]Script_Name:2+" for "+IME_t_UserInitials
					SAVE RECORD:C53([SCRIPTS:80])
					UNLOAD RECORD:C212([SCRIPTS:80])
					
				End if 
				
			End if 
		End if 
		
		ARRAY TEXT:C222(IME_at_Function; 0)
		ARRAY TEXT:C222(IME_at_FunctionCode; 0)
		ARRAY TEXT:C222(IME_at_FunctionName; 0)
		ARRAY TEXT:C222(ME_at_FunctionAccess; 0)
		
		If ($_t_NavDefinitions#"")
			
			
			
			
		End if 
		
	Else 
		
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindCompanies")+">Companies</A><BR>"
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindContacts")+">Contacts</A><BR>"
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindProducts")+">Products</A><BR>"
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindOrders")+">Orders</A><BR>"
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindServiceCalls")+">Service Calls</A><BR>"
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindDiary")+">Diary</A><BR>"
		$_t_Output:=$_t_Output+"<BR>"
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindProjects")+">Projects</A><BR>"
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindJobs")+">Jobs</A><BR>"
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindJobStages")+">Job Stages</A><BR>"
		$_t_Output:=$_t_Output+"<A HREF="+IME_DBEncrypt("DBFindJobStagePer")+">Job Stage Personnel</A><BR>"
		
	End if 
	
Else 
	
	$_t_Output:=""
	
End if 

$0:=$_t_Output
ERR_MethodTrackerReturn("IME DBNavigation"; $_t_oldMethodName)