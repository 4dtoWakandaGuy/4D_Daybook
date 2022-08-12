//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME AccessCreate
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
	C_BOOLEAN:C305($_bo_Create)
	C_DATE:C307($_d_CurrentDate)
	C_LONGINT:C283($2)
	C_TEXT:C284(<>sRefPrefix; $_t_ClientIP; $_t_HostName; $_t_oldMethodName; $1; IME_t_ClientIP; IME_t_Referer; IME_t_URLHost; vWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME AccessCreate")
//IME AccessCreate


$_t_HostName:=Substring:C12(IME_t_URLHost; 1; 79)

If ($_t_HostName="www")  //Rollo 11/6/2001 - avoid saving rows - I think this is nimda
	vWebRef:=<>sRefPrefix+String:C10(Sequence number:C244([WEB_ACCESS:130]))
Else 
	
	$_d_CurrentDate:=Current date:C33
	$_t_ClientIP:=Substring:C12(IME_t_ClientIP; 1; 79)
	
	$_bo_Create:=True:C214
	
	If (False:C215) & ($_t_ClientIP#"")  //could operate on one access per IP
		
		READ WRITE:C146([WEB_ACCESS:130])
		
		QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Client_IP:5=$_t_ClientIP; *)
		QUERY:C277([WEB_ACCESS:130];  & ; [WEB_ACCESS:130]Access_Date:2=$_d_CurrentDate; *)
		QUERY:C277([WEB_ACCESS:130];  & ; [WEB_ACCESS:130]Host_Name:6=$_t_HostName)
		
		If (Records in selection:C76([WEB_ACCESS:130])>0)
			$_bo_Create:=False:C215
			[WEB_ACCESS:130]Hits:8:=[WEB_ACCESS:130]Hits:8+1
			SAVE RECORD:C53([WEB_ACCESS:130])
		End if 
		
	End if 
	
	If ($_bo_Create)
		
		CREATE RECORD:C68([WEB_ACCESS:130])
		
		[WEB_ACCESS:130]Web_Ref:1:=<>sRefPrefix+String:C10(Sequence number:C244([WEB_ACCESS:130]))
		[WEB_ACCESS:130]Access_Date:2:=$_d_CurrentDate
		[WEB_ACCESS:130]Access_Time:3:=Current time:C178
		[WEB_ACCESS:130]Referer:4:=IME_t_Referer
		[WEB_ACCESS:130]Client_IP:5:=$_t_ClientIP
		[WEB_ACCESS:130]Host_Name:6:=$_t_HostName
		
		If (Count parameters:C259>0)
			[WEB_ACCESS:130]Site:7:=Substring:C12($1; 1; 21)
		End if 
		
		If (Count parameters:C259>1)
			[WEB_ACCESS:130]Hits:8:=$2  //will start at zero if not passed
		End if 
		
		SAVE RECORD:C53([WEB_ACCESS:130])
		
	End if 
	
	vWebRef:=[WEB_ACCESS:130]Web_Ref:1
	UNLOAD RECORD:C212([WEB_ACCESS:130])
	
End if 
ERR_MethodTrackerReturn("IME AccessCreate"; $_t_oldMethodName)