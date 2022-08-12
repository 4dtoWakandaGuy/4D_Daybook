
If (False:C215)
	//Form Name:      COMPANIES.dPath_Test.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_GS; 0)
	C_TEXT:C284(<>GS; <>OLDPathName; <>PathName; <>SYS_t_VersionNumber; <>UserName; $_t_oldMethodName; VTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.Button1"; Form event code:C388)
READ WRITE:C146([USER:15])
LOAD RECORD:C52([USER:15])
ARRAY TEXT:C222($_at_GS; 0)
LIST TO ARRAY:C288("Version"; $_at_GS)
<>GS:=$_at_GS{1}
If (<>GS="GOLD")
	vTitle7:=<>PathName
	VTitle2:="Daybook Review"
	vTitle2:=Uppers2(vTitle2)
	[USER:15]Organisation:1:=vTitle2
	<>UserName:=[USER:15]Organisation:1
	$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.Button1"; Form event code:C388)
	READ WRITE:C146([USER:15])
	LOAD RECORD:C52([USER:15])
	ARRAY TEXT:C222($_at_GS; 0)
	LIST TO ARRAY:C288("Version"; $_at_GS)
	<>GS:=$_at_GS{1}
	
	
	If (<>GS="GOLD")
		vTitle7:=<>PathName
		VTitle2:="Daybook Review"
		vTitle2:=Uppers2(vTitle2)
		[USER:15]Organisation:1:=vTitle2
		<>UserName:=[USER:15]Organisation:1
		Case of 
			: (<>SYS_t_VersionNumber<="5.0.999")
				<>PathName:="U05\\q-LpBbzuND5f-/9AZn0"
			: (<>SYS_t_VersionNumber<="5.1.999")
				<>PathName:="64u\\u-1-10mu4Vh5x29g5CR1J7"
			: (<>SYS_t_VersionNumber<="5.2.999")
				<>PathName:="44a\\p1-F1--55q4EcV01105j0D0"
			: (<>SYS_t_VersionNumber<="5.3.999")
				<>PathName:="FA\\p04D0Aa5hLx0b94cS110m5Y"
				
			Else 
				ALERT:C41("Sorry no temporary licence is valid for this version")
				QUIT 4D:C291
		End case 
		
		If (<>OLDPathName#<>PathName)
			[USER:15]Path Name:12:=<>PathName
			Path_Check
			[USER:15]Limit Date:58:=Current date:C33+90
		Else 
			[USER:15]Path Name:12:=""
			<>PathName:=""
			Path_Check
			[USER:15]Limit Date:58:=Current date:C33-1
		End if 
		
		DB_SaveRecord(->[USER:15])
		ACCEPT:C269
	Else 
		vTitle7:=<>PathName
		VTitle2:="Daybook Review"
		vTitle2:=Uppers2(vTitle2)
		[USER:15]Organisation:1:=vTitle2
		<>UserName:=[USER:15]Organisation:1
		
		<>PathName:="U05\\q-LpBbzuND5f-/9AZn0"
		If (<>OLDPathName#<>PathName)
			[USER:15]Path Name:12:=<>PathName
			Path_Check
			[USER:15]Limit Date:58:=Current date:C33+90
		Else 
			[USER:15]Path Name:12:=<>OLDPathName
			<>PathName:=<>OLDPathName
			Path_Check
			[USER:15]Limit Date:58:=Current date:C33-1
		End if 
		DB_SaveRecord(->[USER:15])
		UNLOAD RECORD:C212([USER:15])
		READ ONLY:C145([USER:15])
		
		If (<>PathName#<>OLDPathName) & (<>pathName#"")
			ACCEPT:C269
		Else 
			//  ALERT("Sorry you may not re-use the temporary licence!")
			Gen_Alert("Sorry, you may not re-use the temporary licence!")
			CANCEL:C270
			QUIT 4D:C291
		End if 
	End if 
	
	
	
	If (<>OLDPathName#<>PathName)
		[USER:15]Path Name:12:=<>PathName
		Path_Check
		[USER:15]Limit Date:58:=Current date:C33+90
	Else 
		[USER:15]Path Name:12:=""
		<>PathName:=""
		Path_Check
		[USER:15]Limit Date:58:=Current date:C33-1
	End if 
	
	DB_SaveRecord(->[USER:15])
	ACCEPT:C269
Else 
	vTitle7:=<>PathName
	VTitle2:="Daybook Review"
	vTitle2:=Uppers2(vTitle2)
	[USER:15]Organisation:1:=vTitle2
	<>UserName:=[USER:15]Organisation:1
	
	<>PathName:="U05\\q-LpBbzuND5f-/9AZn0"
	If (<>OLDPathName#<>PathName)
		[USER:15]Path Name:12:=<>PathName
		Path_Check
		[USER:15]Limit Date:58:=Current date:C33+90
	Else 
		[USER:15]Path Name:12:=<>OLDPathName
		<>PathName:=<>OLDPathName
		Path_Check
		[USER:15]Limit Date:58:=Current date:C33-1
	End if 
	DB_SaveRecord(->[USER:15])
	UNLOAD RECORD:C212([USER:15])
	READ ONLY:C145([USER:15])
	
	If (<>PathName#<>OLDPathName) & (<>pathName#"")
		ACCEPT:C269
	Else 
		//  ALERT("Sorry you may not re-use the temporary licence!")
		Gen_Alert("Sorry, you may not re-use the temporary licence!")
		CANCEL:C270
		QUIT 4D:C291
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dPath_Test.Button1"; $_t_oldMethodName)
$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.Button1"; Form event code:C388)
READ WRITE:C146([USER:15])
LOAD RECORD:C52([USER:15])
ARRAY TEXT:C222($_at_GS; 0)
LIST TO ARRAY:C288("Version"; $_at_GS)
<>GS:=$_at_GS{1}
If (<>GS="GOLD")
	vTitle7:=<>PathName
	VTitle2:="Daybook Review"
	vTitle2:=Uppers2(vTitle2)
	[USER:15]Organisation:1:=vTitle2
	<>UserName:=[USER:15]Organisation:1
	
	READ WRITE:C146([USER:15])
	LOAD RECORD:C52([USER:15])
	ARRAY TEXT:C222($_at_GS; 0)
	LIST TO ARRAY:C288("Version"; $_at_GS)
	<>GS:=$_at_GS{1}
	
	
	If (<>GS="GOLD")
		vTitle7:=<>PathName
		VTitle2:="Daybook Review"
		vTitle2:=Uppers2(vTitle2)
		[USER:15]Organisation:1:=vTitle2
		<>UserName:=[USER:15]Organisation:1
		Case of 
			: (<>SYS_t_VersionNumber<="5.0.999")
				<>PathName:="U05\\q-LpBbzuND5f-/9AZn0"
			: (<>SYS_t_VersionNumber<="5.1.999")
				<>PathName:="64u\\u-1-10mu4Vh5x29g5CR1J7"
			: (<>SYS_t_VersionNumber<="5.2.999")
				<>PathName:="44a\\p1-F1--55q4EcV01105j0D0"
			: (<>SYS_t_VersionNumber<="5.3.999")
				<>PathName:="FA\\p04D0Aa5hLx0b94cS110m5Y"
				
			Else 
				ALERT:C41("Sorry no temporary licence is valid for this version")
				QUIT 4D:C291
		End case 
		
		If (<>OLDPathName#<>PathName)
			[USER:15]Path Name:12:=<>PathName
			Path_Check
			[USER:15]Limit Date:58:=Current date:C33+90
		Else 
			[USER:15]Path Name:12:=""
			<>PathName:=""
			Path_Check
			[USER:15]Limit Date:58:=Current date:C33-1
		End if 
		
		DB_SaveRecord(->[USER:15])
		ACCEPT:C269
	Else 
		vTitle7:=<>PathName
		VTitle2:="Daybook Review"
		vTitle2:=Uppers2(vTitle2)
		[USER:15]Organisation:1:=vTitle2
		<>UserName:=[USER:15]Organisation:1
		
		<>PathName:="U05\\q-LpBbzuND5f-/9AZn0"
		If (<>OLDPathName#<>PathName)
			[USER:15]Path Name:12:=<>PathName
			Path_Check
			[USER:15]Limit Date:58:=Current date:C33+90
		Else 
			[USER:15]Path Name:12:=<>OLDPathName
			<>PathName:=<>OLDPathName
			Path_Check
			[USER:15]Limit Date:58:=Current date:C33-1
		End if 
		DB_SaveRecord(->[USER:15])
		UNLOAD RECORD:C212([USER:15])
		READ ONLY:C145([USER:15])
		
		If (<>PathName#<>OLDPathName) & (<>pathName#"")
			ACCEPT:C269
		Else 
			//  ALERT("Sorry you may not re-use the temporary licence!")
			Gen_Alert("Sorry, you may not re-use the temporary licence!")
			CANCEL:C270
			QUIT 4D:C291
		End if 
	End if 
	
	
	
	If (<>OLDPathName#<>PathName)
		[USER:15]Path Name:12:=<>PathName
		Path_Check
		[USER:15]Limit Date:58:=Current date:C33+90
	Else 
		[USER:15]Path Name:12:=""
		<>PathName:=""
		Path_Check
		[USER:15]Limit Date:58:=Current date:C33-1
	End if 
	
	DB_SaveRecord(->[USER:15])
	ACCEPT:C269
Else 
	vTitle7:=<>PathName
	VTitle2:="Daybook Review"
	vTitle2:=Uppers2(vTitle2)
	[USER:15]Organisation:1:=vTitle2
	<>UserName:=[USER:15]Organisation:1
	
	<>PathName:="U05\\q-LpBbzuND5f-/9AZn0"
	If (<>OLDPathName#<>PathName)
		[USER:15]Path Name:12:=<>PathName
		Path_Check
		[USER:15]Limit Date:58:=Current date:C33+90
	Else 
		[USER:15]Path Name:12:=<>OLDPathName
		<>PathName:=<>OLDPathName
		Path_Check
		[USER:15]Limit Date:58:=Current date:C33-1
	End if 
	DB_SaveRecord(->[USER:15])
	UNLOAD RECORD:C212([USER:15])
	READ ONLY:C145([USER:15])
	
	If (<>PathName#<>OLDPathName) & (<>pathName#"")
		ACCEPT:C269
	Else 
		//  ALERT("Sorry you may not re-use the temporary licence!")
		Gen_Alert("Sorry, you may not re-use the temporary licence!")
		CANCEL:C270
		QUIT 4D:C291
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dPath_Test.Button1"; $_t_oldMethodName)
