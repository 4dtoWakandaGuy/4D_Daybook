//%attributes = {}

If (False:C215)
	//Project Method Name:      EmailValidateAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/06/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_LONGINT:C283($_l_BreakPosition; $_l_Position)
	C_POINTER:C301($_PTR_EMAILAFTERAT; $_PTR_EMAILBEFOREAT; $2; $3)
	C_TEXT:C284($_t_CommandLine; $_t_DOmain; $_T_EmailAddress; $_t_EMailSubAddress; $_t_Error; $_t_In; $_t_MailServer; $_t_oldMethodName; $_t_Out; $_t_Pattern; $1)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("EmailValidateAddress")
$0:=True:C214
$_T_EmailAddress:=$1
If (Count parameters:C259>=3)
	$_PTR_EMAILBEFOREAT:=$2
	$_PTR_EMAILAFTERAT:=$3
Else 
	$_PTR_EMAILBEFOREAT:=->$_t_EMailSubAddress
	$_PTR_EMAILAFTERAT:=->$_t_DOmain
End if 

If ($_T_EmailAddress#"") & (Position:C15(Char:C90(64); $_T_EmailAddress; *)<1)
	$0:=False:C215
Else 
	$_l_BreakPosition:=Position:C15(Char:C90(64); $_T_EmailAddress; *)
	$_t_Pattern:="(?i)^([A-Z0-9._%+-]+)@(?:[A-Z0-9_-]+\\.)+([A-Z]{2,4})$(.*)"
	$_t_DOmain:=Substring:C12($_T_EmailAddress; $_l_BreakPosition+1)
	$_t_EMailSubAddress:=Substring:C12($_T_EmailAddress; 1; $_l_BreakPosition-1)
	//$_t_EmailAddress:=<User>_4D<Domain>
	If (Match regex:C1019($_t_Pattern; $_t_EmailAddress))
		// ... Do something ...
		If (Is macOS:C1572) | (True:C214)  //this works on both osx and windows
			
			
			$_t_CommandLine:="nslookup "+$_t_DOmain
			
			$_t_In:=""
			$_t_Out:=""
			$_t_Error:=""
			LAUNCH EXTERNAL PROCESS:C811($_t_CommandLine; $_t_In; $_t_Out; $_t_Error)
			TRACE:C157
			$_l_Position:=Position:C15("** server can't find"; $_t_Out)
			//A bad address will get something like Server:\t\t200.28.11.1\nAddress:\t200.28.11.1#53\n\n** server can't find me.con: NXDOMAIN\n\n
			//a good address will get something like Server:\t\t200.28.11.1\nAddress:\t200.28.11.1#53\n\nNon-authoritative answer:\nName:\tme.com\nAddress: 17.142.160.83\nName:\tme.com\nAddress: 17.178.96.97\nName:\tme.com\nAddress: 17.172.224.103\n\n
			If ($_l_Position>0)
				$0:=False:C215  //its a bad address
				//$0:=True
				//telnet MAIL_SERVER MAIL_PORT
				
			Else 
				//TRACE
				$0:=True:C214
				$_PTR_EMAILBEFOREAT->:=$_t_EMailSubAddress
				$_PTR_EMAILAFTERAT->:=$_t_DOmain
				If (False:C215)  //going beyond checking the domain is real is not so easy...
					
					$_l_Position:=Position:C15("Name:"; $_t_Out)
					If ($_l_Position>0)
						$_t_MailServer:=Substring:C12($_t_Out; $_l_Position+Length:C16("Name:"))
						$_l_Position:=Position:C15(Char:C90(9); $_t_MailServer)
						If ($_l_Position>0)
							$_t_MailServer:=Substring:C12($_t_MailServer; $_l_Position+1)
						End if 
						$_l_Position:=Position:C15(Char:C90(10); $_t_MailServer)
						If ($_l_Position>0)
							$_t_MailServer:=Substring:C12($_t_MailServer; 1; $_l_Position-1)
						End if 
						//this would be feasible if we have telnet installed
						//$_t_CommandLine:="nc "+$_t_MailServer+" 25")
						//$_t_In:=""
						//$_t_Out:=""
						//$_t_Error:=""
						///LAUNCH EXTERNAL PROCESS($_t_CommandLine;$_t_In;$_t_Out;$_t_Error)
					End if 
					
				End if 
			End if 
		Else 
			$0:=False:C215
			//its bad
		End if 
		
	Else 
		$0:=False:C215
	End if 
End if 
ERR_MethodTrackerReturn("EmailValidateAddress"; $_t_oldMethodName)

