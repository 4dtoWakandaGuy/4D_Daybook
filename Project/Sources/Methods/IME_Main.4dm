//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_Main
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>IME_at_RobotIPs;0)
	//ARRAY TEXT(<>IME_at_RobotWebRefs;0)
	C_BLOB:C604(IME_blb_Result)
	C_BOOLEAN:C305(<>IME_bo_Test; <>ISTARTUP; $_bo_CheckDirectSecurity; IME_bo_isaRobot; IME_bo_FlushAllowed; IME_bo_Flushed; IME_bo_FromWebRequest; IME_bo_ReplyBLOBAllowed; IME_bo_IsInternetManager)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>IACTIVPROC; $_l_ArraySize; $_l_NameRecord; $_l_Records; $_l_RobotIPRoll; $1; IME_l_CachePageNoBrowserId; IME_l_CachePageNoPrefix; IME_l_CachePageTimeout; IME_l_EncryptChecksumStart; IME_l_EncryptDay)
	C_LONGINT:C283(IME_l_EncryptTime; IME_l_RequestID; viReqID)
	C_TEXT:C284(<>iEncrypt; <>IWS_t_LocalAddress; <>STR_t_CR; <>STR_t_LF; $_t_ClientIP; $_t_Direct; $_t_Name; $_t_oldMethodName; $_t_Result; $_t_Text; $2)
	C_TEXT:C284(IME_t_CachePageDataCode; IME_t_CachePageReplace; IME_t_ClientIP; IME_t_Result; IME_t_Search; IME_t_UserGroupCode; IME_t_UserInitials; IME_t_UserName; IME_t_UserOrganization; IWS_t_Search; viSearch)
	C_TEXT:C284(vSVField3Ex; vSVField4Ex; vURLWebRef; vWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_Main")
//IME Main

Start_Process

IME_WebMessagesInit
IME_bo_FromWebRequest:=True:C214  //added 26/02/08 (certain methods that end up being called can check the value of this var and behave differently if needed...for instance by not throwing up a dialog box)


READ ONLY:C145(*)

//The First_Parameter is an identifier of
//the particular connection to the web server.
viReqID:=$1
IME_l_RequestID:=$1
//The second parameter passed is the "direct parameter", which is the information
//following domain in the URL.

$_t_Direct:=$2

IME_bo_Flushed:=False:C215
IME_GetClientDetails

UTI_BlobClear(->IME_blb_Result)
IME_t_Result:=""
IME_bo_FlushAllowed:=True:C214
IME_bo_ReplyBLOBAllowed:=True:C214

If ($_t_Direct="")
	$_t_Direct:="Index"
End if 
IME_bo_IsInternetManager:=True:C214
If (<>iStartup)
	Macro2("IMA Error5")
Else 
	
	Case of 
		: ($_t_Direct="PING")  //for testing purposes only
			$_t_Result:="PING OK"
			TEXT TO BLOB:C554($_t_Result; IME_blb_Result; Mac text without length:K22:10; *)
			
		: (IWS_ConnectionsRefused)  //the Refuse connections check box is checked
			$_t_Result:="<HTML><B>Error No 6</B><P>Connection Refused."+"<P>Please try again in a minute or so.</HTML>"  //Rollo 7/26/99
			TEXT TO BLOB:C554($_t_Result; IME_blb_Result; Mac text without length:K22:10; *)  //Rollo 7/26/99
			//MAC_Run (◊IME_t_MacroPrefix+"Error6")  `Rollo 7/26/99
			
		Else 
			
			IME_t_CachePageDataCode:=""  //clear cache variables - are tested at the base
			IME_l_CachePageTimeout:=0
			IME_t_CachePageReplace:=""
			IME_l_CachePageNoPrefix:=0
			IME_l_CachePageNoBrowserId:=0
			
			viSearch:=IWS_t_Search
			
			//IME_GetClientDetails    `Rollo 7/2/99 - move to top for efficiency
			IME_t_Search:=IWS_t_Search
			//make a semi-unique ID of the Browser from the Computer, Browser type, & ClientIP
			//Rollo 7/6/99 - moved to top - IME_l_Browser:=IME_Checksum
			//Rollo 7/6/99 - (IWS_GetHeaderField("User-Agent")+IME_t_ClientIP)
			
			//preset the timeout info used in the encryption - see IME_Encrypt2
			If (<>iEncrypt#"")
				IME_l_EncryptTime:=Num:C11(Substring:C12(Time string:C180(Current time:C178); 1; 2))  //ie will not work if not same 2-hour period
				IME_l_EncryptDay:=Day number:C114(Current date:C33)  //on the same day of the week
				IME_l_EncryptChecksumStart:=(65+IME_l_EncryptTime-64)+(67+(IME_l_EncryptDay*2)-64)
			End if 
			
			IME_t_UserName:=""
			IME_t_UserInitials:=""
			IME_t_UserGroupCode:=""
			//IME_t_UserJobTitle:=""
			//IME_t_UserType:=""
			IME_t_UserOrganization:=""
			
			//IME_t_AccessTempRef:=""  `set to blank initially - evaluation comes after decryption
			
			//IME_l_CountImage:=0  `Counts the no of IMGs sent
			//IME_l_CountInput:=0  `Counts the no of INPUTs sent
			
			vWebRef:=""
			vURLWebRef:=""
			$_bo_CheckDirectSecurity:=True:C214
			
			If ($_t_Direct="*@")  //general decryption
				$_bo_CheckDirectSecurity:=False:C215
				$_t_Direct:=IME_Decrypt($_t_Direct)
				viSearch:=IME_Decrypt(viSearch)  //decrypt this even if someone removes the *
				If (<>iActivProc#0)
					$_t_Text:=$_t_Direct+", "+viSearch
				End if 
				If (viSearch="&@")
					viSearch:=Replace string:C233(viSearch; "&"; "")  //remove the &s inserted for ICA Search strings
				End if 
				If (viSearch="Error1")
					$_t_Direct:="Error1"
				End if 
			End if 
			
			If ($_t_Direct="")
				$_t_Direct:="Error3"
			End if 
			
			MESSAGES OFF:C175
			vSVField4Ex:=""  //used in IME ICARecord
			vSVField3Ex:=""  //used to store the replies of Test Macros & ICAs
			//◊RecText:="NoClear"
			
			CAC_DeleteSelectionTimeout  //time out caches that need it
			
			Case of 
					
				: ($_t_Direct="daybook@")  //the Daybook web interface
					IME_Session("Daybook")
					
					If ($_t_Direct="daybook*@")
						
						$_t_Direct:=IME_DecryptWebRef(Substring:C12($_t_Direct; 8)+"?"+IME_t_Search)
						
						If (($_t_Direct#"Error@") & (vWebRef=vURLWebRef))  //the url decrpyts and its web ref matches the cookie web ref
							
							//get values from the cache
							IME_CachedDataGet("WebRef"+vWebRef; "IME_t_UserInitials"; "IME_t_UserName"; "IME_t_UserOrganization"; "IME_t_UserGroupCode")  //see also IME_DBLogin
							IME_CachedDataExpiration("WebRef"+vWebRef; 30)  //keep the cache up to date, since it's in use
							
							If (IME_t_UserName#"")  //we have a currently valid login
								
							Else 
								$_t_Direct:="dblogin"
							End if 
							
						Else 
							$_t_Direct:="dblogin"
						End if 
						
					Else 
						$_t_Direct:="dblogin"
					End if 
					
					Case of 
						: ($_t_Direct="dblogin")
							IME_DBLogin
						: ($_t_Direct="dbdashboard")
							IME_DBDashboard
						: ($_t_Direct="dbfind@")
							IME_DBFind($_t_Direct)
						: ($_t_Direct="dblist@")
							IME_DBList($_t_Direct)
						: ($_t_Direct="dbedit@")
							IME_DBEdit($_t_Direct)
						: ($_t_Direct="dblookup@")
							IME_DBLookup($_t_Direct)
						: ($_t_Direct="dbreport@")
							//IME DBReport ($_t_Direct)
							
						Else   //assume we're using an IMA Macro to draw the page
							IME_MainMacro($_t_Direct)
					End case 
					
				: ((DB_GetModuleSettingByNUM(Module_IntServer))<1)  //if we dont' have access to the internet manager, prevent non daybook access
					Macro2("IMA Error6")
					
				: ((IME_t_URLHost="@thisurl@") | (<>IWS_t_LocalAddress="10.0.1.99") | ($_t_Direct="XX@"))  //example reasons for going into hardcoded case
					
					//IME_Session ("sitename")
					//IME XX($_t_Direct)
					
					
				: (($_t_Direct="robots") | ($_t_Direct="robots.txt"))  //it's a robot
					IWS_SetMIMEType("txt")
					IWS_SetStaticCacheHeader
					IME_Reply("User-agent: *"+<>STR_t_CR+<>STR_t_LF+"Disallow:"+<>STR_t_CR+<>STR_t_LF)
					
					$_t_ClientIP:=Substring:C12(IME_t_ClientIP; 1; 15)  //Rollo 3/10/2003 - cache the robots & don't add sessions
					$_l_RobotIPRoll:=Find in array:C230(<>IME_at_RobotIPs; $_t_ClientIP)
					If ($_l_RobotIPRoll<1)
						IME_AccessCreate("robot"; 1)
						$_l_ArraySize:=Size of array:C274(<>IME_at_RobotIPs)+1
						INSERT IN ARRAY:C227(<>IME_at_RobotIPs; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227(<>IME_at_RobotWebRefs; $_l_ArraySize; 1)
						<>IME_at_RobotIPs{$_l_ArraySize}:=$_t_ClientIP
						<>IME_at_RobotWebRefs{$_l_ArraySize}:=vWebRef
					End if 
					IME_bo_isaRobot:=True:C214
					
				Else   //assume we're using an IMA Macro to draw the page
					
					IME_MainMacro($_t_Direct; $_bo_CheckDirectSecurity)
					
			End case 
			
	End case 
End if 

UNLOAD RECORD:C212([SCRIPTS:80])

If (<>IME_bo_Test)
	READ WRITE:C146([SCRIPTS:80])
	CREATE RECORD:C68([SCRIPTS:80])
	[SCRIPTS:80]Script_Code:1:="ITX Test"+String:C10(Sequence number:C244([SCRIPTS:80]))
	[SCRIPTS:80]Script_Name:2:=String:C10(<>DB_d_CurrentDate)+"   "+Time string:C180(Current time:C178)
	[SCRIPTS:80]Same_Process:6:=True:C214
	[SCRIPTS:80]Recording_Text:4:=IME_t_Result
	SAVE RECORD:C53([SCRIPTS:80])
	UNLOAD RECORD:C212([SCRIPTS:80])
End if 

READ ONLY:C145(*)

IME_Flush(1)
ERR_MethodTrackerReturn("IME_Main"; $_t_oldMethodName)