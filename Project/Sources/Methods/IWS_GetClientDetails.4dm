//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetClientDetails
	//------------------ Method Notes ------------------
	
	//******************************************************************************
	//
	//Written by  John Moore on 10/22/98
	//Modified By Ron Feavyear on 2/1/99 - get FULL version string for Mozilla...
	//
	//Purpose: Fills various IME process variables with data about client
	
	//LOG_SetMethod ("IWS_GetClientDetails")
	
	// b24 Rollo 19990702 - minor bug fix (1 line)
	// b24 John 19990712 - prevent 3 range checking errors from being possible
	//******************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_isDottedAddress)
	C_LONGINT:C283($_l_CharacterCode; $_l_CharacterIndex; $_l_Length; $_l_StartPos; $_l_TotalCharacters)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_Character; $_t_oldMethodName; $_t_Semicolon; $_t_Subtext; $_t_Subtext1; $_t_Subtext2; $_t_Subtext3; $_t_Subtext4; $_t_Text; $_t_UserAgent)
	C_TEXT:C284(IWS_t_BrowserApp; IWS_t_BrowserMake; IWS_t_BrowserVersion; IWS_t_ClientPlatform; IWS_t_Domain; IWS_t_Host; IWS_t_OrgPrefix; IWS_t_Referer; IWS_t_URLHost)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetClientDetails")



//IWS_t_ClientName:=ITK_Addr2Name (IWS_l_RemoteIPAddress;0)  `returns full form


Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		IWS_t_Referer:=IWS_GetHeaderField("Referer")
		IWS_t_OrgPrefix:=""
		IWS_t_Host:=Substring:C12(IWS_GetHeaderField("Host"); 1; 79)  //SHOULD be secure.namevo.com, but sometimes arrives as 0.0.0.0 format
		
		//Rollo 8/31/2000 - temporary fix for IWS_t_URLHost returning "namevo"
		//IWS_t_URLHost:=Substring(IWS_GetHeaderField ("Domain");1;79)
		//could only come from the forwarder - eg secure.namevo.com
		
		IWS_t_URLHost:=IWS_t_Host  //Rollo 8/31/2000
		
		$_bo_isDottedAddress:=False:C215
		
		Case of 
				
			: (IWS_t_URLHost#"")
				If (IWS_IsDottedAddress(IWS_t_URLHost))
					$_bo_isDottedAddress:=True:C214
					//believe the host - it is a dotted address
				Else 
					//believe the forwarder - it has given us the full host name
				End if 
				
			: (IWS_t_Host="")  //should never occur from HTTP 1.1 compliant browser
				IWS_t_URLHost:=""
				
			: (IWS_IsDottedAddress(IWS_t_Host))  //it's a dotted address, so we have to do a reverse DNS lookup
				$_bo_isDottedAddress:=True:C214
				//IWS_t_URLHost:=Substring(ITK_Addr2Name (ITK_Name2Addr (IWS_t_Host;0);1);1;79)  `will return an empty string if could not be resolved ITK OUT
				
		End case 
		
		//we have a valid full URL Host
		If ((IWS_t_URLHost#"") & ($_bo_isDottedAddress=False:C215))
			
			$_l_StartPos:=0
			Case of 
				: (Substring:C12(IWS_t_URLHost; Length:C16(IWS_t_URLHost)-4)=".") & (Substring:C12(IWS_t_URLHost; Length:C16(IWS_t_URLHost)-2)=".")
					//it's something like 'modulus.co.uk'
					$_l_StartPos:=5
				: (Substring:C12(IWS_t_URLHost; Length:C16(IWS_t_URLHost)-3)=".")
					//it's something like 'modulus.net'
					$_l_StartPos:=4
				: (Substring:C12(IWS_t_URLHost; Length:C16(IWS_t_URLHost)-2)=".")
					//it's something like 'modulus.au'
					$_l_StartPos:=3
			End case 
			If ($_l_StartPos>0)
				IWS_t_Domain:=""
				$_l_CharacterIndex:=Length:C16(IWS_t_URLHost)-$_l_StartPos
				$_t_Character:=Substring:C12(IWS_t_URLHost; $_l_CharacterIndex; 1)
				While ($_t_Character#".") & ($_l_CharacterIndex>0)
					IWS_t_Domain:=Substring:C12($_t_Character+IWS_t_Domain; 1; 79)
					$_l_CharacterIndex:=$_l_CharacterIndex-1
					$_t_Character:=Substring:C12(IWS_t_URLHost; $_l_CharacterIndex; 1)
				End while 
				IWS_t_OrgPrefix:=Substring:C12(Substring:C12(IWS_t_URLHost; 1; $_l_CharacterIndex-1); 1; 31)
			Else 
				IWS_t_Domain:=""
				IWS_t_OrgPrefix:=""
			End if 
		Else 
			
			IWS_t_URLHost:=IWS_t_Host  //make sure they're the same, or a blank URLHost is filled
			
		End if 
		
		$_t_Semicolon:=";"
		$_t_UserAgent:=IWS_GetHeaderField("User-Agent")
		//Now get the part in parentheses
		$_t_Subtext:=Substring:C12($_t_UserAgent; Position:C15("("; $_t_UserAgent)+1)
		$_t_Subtext:=Substring:C12($_t_Subtext; 1; Position:C15(")"; $_t_Subtext)-1)
		$_t_Subtext1:=STR_RemoveLeadTrailSpace(STR_Param($_t_Subtext; 1; $_t_Semicolon))
		$_t_Subtext2:=STR_RemoveLeadTrailSpace(STR_Param($_t_Subtext; 2; $_t_Semicolon))
		$_t_Subtext3:=STR_RemoveLeadTrailSpace(STR_Param($_t_Subtext; 3; $_t_Semicolon))
		$_t_Subtext4:=STR_RemoveLeadTrailSpace(STR_Param($_t_Subtext; 4; $_t_Semicolon))  //Rollo 3/15/2001
		
		Case of 
			: ($_t_UserAgent="@MSIE@")  // iexplorer ?
				IWS_t_BrowserMake:="Microsoft"
				IWS_t_BrowserApp:="Internet Explorer"
				IWS_t_BrowserVersion:=Substring:C12(Replace string:C233($_t_Subtext2; "MSIE "; ""); 1; 5)
				If (($_t_Subtext3="AOL@") | ($_t_Subtext3="msn@") | ($_t_Subtext4="Win@") | ($_t_Subtext4="@Mac@"))  //Rollo 3/15/2001
					IWS_t_ClientPlatform:=Substring:C12($_t_Subtext4; 1; 20)
				Else 
					IWS_t_ClientPlatform:=Substring:C12($_t_Subtext3; 1; 20)
				End if 
				
			: ($_t_UserAgent="@Opera@")
				IWS_t_BrowserMake:="Opera"
				IWS_t_BrowserApp:="Opera"
				IWS_t_BrowserVersion:=Substring:C12(Substring:C12($_t_UserAgent; Position:C15(")"; $_t_UserAgent)+2); 1; 5)  //Rollo 7/9/99  ` get version number
				IWS_t_ClientPlatform:=Substring:C12($_t_Subtext3; 1; 20)  //stop range checking errors
				
			: ($_t_UserAgent="Mozilla@")  // netscape ??
				IWS_t_BrowserMake:="Netscape"
				$_l_Length:=Length:C16($_t_UserAgent)
				$_l_StartPos:=Position:C15("/"; $_t_UserAgent)
				If ($_l_StartPos<1)
					IWS_t_BrowserVersion:="na"
				Else 
					$_l_StartPos:=$_l_StartPos+1
					$_l_TotalCharacters:=1
					For ($_l_CharacterIndex; ($_l_StartPos+1); $_l_Length)
						$_l_CharacterCode:=Character code:C91($_t_UserAgent[[$_l_CharacterIndex]])
						Case of 
							: ($_l_CharacterCode=Character code:C91("."))
							: (($_l_CharacterCode>=Character code:C91("0")) & ($_l_CharacterCode<=Character code:C91("9")))
							Else 
								$_l_TotalCharacters:=($_l_CharacterIndex-$_l_StartPos)
								$_l_CharacterIndex:=$_l_Length+1
						End case 
					End for 
					IWS_t_BrowserVersion:=Substring:C12(Substring:C12($_t_UserAgent; $_l_StartPos; $_l_TotalCharacters); 1; 5)  //Rollo 7/9/99
				End if 
				
				If (Num:C11(IWS_t_BrowserVersion)<4)
					IWS_t_BrowserApp:="Navigator"
				Else 
					IWS_t_BrowserApp:="Communicator"
				End if 
				
				If (($_t_Subtext1="AOL@") | ($_t_Subtext1="msn@") | ($_t_Subtext2="Win@") | ($_t_Subtext2="@Mac@"))  //Rollo 3/15/2001
					IWS_t_ClientPlatform:=Substring:C12($_t_Subtext2; 1; 20)
				Else 
					IWS_t_ClientPlatform:=Substring:C12($_t_Subtext1; 1; 20)
				End if 
				
				// $text:=Substring($_t_UserAgent;Position("(";$_t_UserAgent)+1)
				//IWS_t_ClientPlatform:=Substring(Substring($text;1;Position(";";$text)-1);1;20)
				
			Else 
				IWS_t_BrowserMake:="Other"  //Rollo 7/2/99
				IWS_t_BrowserApp:="Other"
				IWS_t_BrowserVersion:="1"
				IWS_t_ClientPlatform:="Unknown"
		End case 
		
		//standardise the various Mac versions
		If (IWS_t_ClientPlatform="@PowerPC@") | (IWS_t_ClientPlatform="@PPC@") | (IWS_t_ClientPlatform="@Mac@")
			IWS_t_ClientPlatform:="Macintosh"
		End if 
		
		
	: (<>Web_t_ServerHandler="NTK")
		
		IWS_t_Referer:=IWS_GetHeaderField("Referer")
		IWS_t_OrgPrefix:=""
		IWS_t_Host:=Substring:C12(IWS_GetHeaderField("Host"); 1; 79)  //SHOULD be secure.namevo.com, but sometimes arrives as 0.0.0.0 format
		
		//Rollo 8/31/2000 - temporary fix for IWS_t_URLHost returning "namevo"
		//IWS_t_URLHost:=Substring(IWS_GetHeaderField ("Domain");1;79)
		//could only come from the forwarder - eg secure.namevo.com
		
		IWS_t_URLHost:=IWS_t_Host  //Rollo 8/31/2000
		
		$_bo_isDottedAddress:=False:C215
		
		Case of 
				
			: (IWS_t_URLHost#"")
				If (IWS_IsDottedAddress(IWS_t_URLHost))
					$_bo_isDottedAddress:=True:C214
					//believe the host - it is a dotted address
				Else 
					//believe the forwarder - it has given us the full host name
				End if 
				
			: (IWS_t_Host="")  //should never occur from HTTP 1.1 compliant browser
				IWS_t_URLHost:=""
				
			: (IWS_IsDottedAddress(IWS_t_Host))  //it's a dotted address, so we have to do a reverse DNS lookup
				$_bo_isDottedAddress:=True:C214
				IWS_t_URLHost:=Substring:C12(NTK Get Host By Address(IWS_t_Host); 1; 79)
				
		End case 
		
		//we have a valid full URL Host
		If ((IWS_t_URLHost#"") & ($_bo_isDottedAddress=False:C215))
			
			$_l_StartPos:=0
			Case of 
				: (Substring:C12(IWS_t_URLHost; Length:C16(IWS_t_URLHost)-4)=".") & (Substring:C12(IWS_t_URLHost; Length:C16(IWS_t_URLHost)-2)=".")
					//it's something like 'icogno.co.uk'
					$_l_StartPos:=5
				: (Substring:C12(IWS_t_URLHost; Length:C16(IWS_t_URLHost)-3)=".")
					//it's something like icogno.net'
					$_l_StartPos:=4
				: (Substring:C12(IWS_t_URLHost; Length:C16(IWS_t_URLHost)-2)=".")
					//it's something like icogno.au'
					$_l_StartPos:=3
			End case 
			If ($_l_StartPos>0)
				IWS_t_Domain:=""
				$_l_CharacterIndex:=Length:C16(IWS_t_URLHost)-$_l_StartPos
				$_t_Character:=Substring:C12(IWS_t_URLHost; $_l_CharacterIndex; 1)
				While ($_t_Character#".") & ($_l_CharacterIndex>0)
					IWS_t_Domain:=Substring:C12($_t_Character+IWS_t_Domain; 1; 79)
					$_l_CharacterIndex:=$_l_CharacterIndex-1
					$_t_Character:=Substring:C12(IWS_t_URLHost; $_l_CharacterIndex; 1)
				End while 
				IWS_t_OrgPrefix:=Substring:C12(Substring:C12(IWS_t_URLHost; 1; $_l_CharacterIndex-1); 1; 31)
			Else 
				IWS_t_Domain:=""
				IWS_t_OrgPrefix:=""
			End if 
		Else 
			
			IWS_t_URLHost:=IWS_t_Host  //make sure they're the same, or a blank URLHost is filled
			
		End if 
		
		$_t_Semicolon:=";"
		$_t_UserAgent:=IWS_GetHeaderField("User-Agent")
		//Now get the part in parentheses
		$_t_Subtext:=Substring:C12($_t_UserAgent; Position:C15("("; $_t_UserAgent)+1)
		$_t_Subtext:=Substring:C12($_t_Subtext; 1; Position:C15(")"; $_t_Subtext)-1)
		$_t_Subtext1:=STR_RemoveLeadTrailSpace(STR_Param($_t_Subtext; 1; $_t_Semicolon))
		$_t_Subtext2:=STR_RemoveLeadTrailSpace(STR_Param($_t_Subtext; 2; $_t_Semicolon))
		$_t_Subtext3:=STR_RemoveLeadTrailSpace(STR_Param($_t_Subtext; 3; $_t_Semicolon))
		$_t_Subtext4:=STR_RemoveLeadTrailSpace(STR_Param($_t_Subtext; 4; $_t_Semicolon))  //Rollo 3/15/2001
		
		Case of 
			: ($_t_UserAgent="@MSIE@")  // iexplorer ?
				IWS_t_BrowserMake:="Microsoft"
				IWS_t_BrowserApp:="Internet Explorer"
				IWS_t_BrowserVersion:=Substring:C12(Replace string:C233($_t_Subtext2; "MSIE "; ""); 1; 5)
				If (($_t_Subtext3="AOL@") | ($_t_Subtext3="msn@") | ($_t_Subtext4="Win@") | ($_t_Subtext4="@Mac@"))  //Rollo 3/15/2001
					IWS_t_ClientPlatform:=Substring:C12($_t_Subtext4; 1; 20)
				Else 
					IWS_t_ClientPlatform:=Substring:C12($_t_Subtext3; 1; 20)
				End if 
				
			: ($_t_UserAgent="@Opera@")
				IWS_t_BrowserMake:="Opera"
				IWS_t_BrowserApp:="Opera"
				IWS_t_BrowserVersion:=Substring:C12(Substring:C12($_t_UserAgent; Position:C15(")"; $_t_UserAgent)+2); 1; 5)  //Rollo 7/9/99  ` get version number
				IWS_t_ClientPlatform:=Substring:C12($_t_Subtext3; 1; 20)  //stop range checking errors
				
			: ($_t_UserAgent="Mozilla@")  // netscape ??
				IWS_t_BrowserMake:="Netscape"
				$_l_Length:=Length:C16($_t_UserAgent)
				$_l_StartPos:=Position:C15("/"; $_t_UserAgent)
				If ($_l_StartPos<1)
					IWS_t_BrowserVersion:="na"
				Else 
					$_l_StartPos:=$_l_StartPos+1
					$_l_TotalCharacters:=1
					For ($_l_CharacterIndex; ($_l_StartPos+1); $_l_Length)
						$_l_CharacterCode:=Character code:C91($_t_UserAgent[[$_l_CharacterIndex]])  //v11 Character code
						Case of 
							: ($_l_CharacterCode=Character code:C91("."))  //v11 Character code
							: (($_l_CharacterCode>=Character code:C91("0")) & ($_l_CharacterCode<=Character code:C91("9")))  //v11 Character code
							Else 
								$_l_TotalCharacters:=($_l_CharacterIndex-$_l_StartPos)
								$_l_CharacterIndex:=$_l_Length+1
						End case 
					End for 
					IWS_t_BrowserVersion:=Substring:C12(Substring:C12($_t_UserAgent; $_l_StartPos; $_l_TotalCharacters); 1; 5)  //Rollo 7/9/99
				End if 
				
				If (Num:C11(IWS_t_BrowserVersion)<4)
					IWS_t_BrowserApp:="Navigator"
				Else 
					IWS_t_BrowserApp:="Communicator"
				End if 
				
				If (($_t_Subtext1="AOL@") | ($_t_Subtext1="msn@") | ($_t_Subtext2="Win@") | ($_t_Subtext2="@Mac@"))  //Rollo 3/15/2001
					IWS_t_ClientPlatform:=Substring:C12($_t_Subtext2; 1; 20)
				Else 
					IWS_t_ClientPlatform:=Substring:C12($_t_Subtext1; 1; 20)
				End if 
				
				// $text:=Substring($_t_UserAgent;Position("(";$_t_UserAgent)+1)
				//IWS_t_ClientPlatform:=Substring(Substring($text;1;Position(";";$text)-1);1;20)
				
			Else 
				IWS_t_BrowserMake:="Other"  //Rollo 7/2/99
				IWS_t_BrowserApp:="Other"
				IWS_t_BrowserVersion:="1"
				IWS_t_ClientPlatform:="Unknown"
		End case 
		
		//standardise the various Mac versions
		If (IWS_t_ClientPlatform="@PowerPC@") | (IWS_t_ClientPlatform="@PPC@") | (IWS_t_ClientPlatform="@Mac@")
			IWS_t_ClientPlatform:="Macintosh"
		End if 
		//LOG_ResetMethod
		
	Else 
		
		
End case 

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_GetClientDetails"; $_t_oldMethodName)