//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_SetPage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2011 22:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DBWS_at_FormFields;0)
	//ARRAY TEXT(DBWS_at_FormValues;0)
	C_BLOB:C604(<>DBWS_Bl_home)
	C_BOOLEAN:C305(<>DBWS_bo_optim)
	C_LONGINT:C283($_l_Platform; $_l_StringPosition)
	C_TEXT:C284($_t_DocumentNameExtension; $_t_oldMethodName; $_t_PathtoDocInternal; $_t_PathtoWebStyleDocument; $_t_ResourcesPath; $_t_Seperator; $_t_WebFolderParent; $_t_WebStyle; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_SetPage")

Case of 
	: ($1="Home")
		
		If (<>DBWS_bo_optim)
			If (BLOB size:C605(<>DBWS_Bl_home)=0)
				//_O_PLATFORM PROPERTIES($_l_Platform)
				Get_PlatformProperty("Platform"; ->$_l_Platform)
				If ($_l_Platform=3)
					$_t_Seperator:="\\"
				Else 
					$_t_Seperator:=":"
				End if 
				DOCUMENT TO BLOB:C525($_t_Seperator+"www"+$_t_Seperator+$2+".gz"; <>DBWS_Bl_home)
				
				
			End if 
			
			ARRAY TEXT:C222(DBWS_at_FormFields; 0)
			ARRAY TEXT:C222(DBWS_at_FormValues; 0)
			APPEND TO ARRAY:C911(DBWS_at_FormFields; "Cache-Control")
			APPEND TO ARRAY:C911(DBWS_at_FormValues; "public,  max-age=315360000")
			APPEND TO ARRAY:C911(DBWS_at_FormFields; "Expires")
			APPEND TO ARRAY:C911(DBWS_at_FormValues; "Fri, 1 Jan 2019 00:00:00 GMT")
			APPEND TO ARRAY:C911(DBWS_at_FormFields; "Content-Encoding")
			APPEND TO ARRAY:C911(DBWS_at_FormValues; "gzip")
			
			WEB SET HTTP HEADER:C660(DBWS_at_FormFields; DBWS_at_FormValues)
			WEB SEND RAW DATA:C815(<>DBWS_Bl_home)
		Else 
			DBWS_SetPage(""; $2)
			//wx_Page("home.shtml")
		End if 
	Else 
		
		$_t_DocumentNameExtension:="shtml"
		//This is the name of the output html.
		//so that we can offer different styles the different styles are kept
		$_t_ResourcesPath:=Get 4D folder:C485(Current resources folder:K5:16)
		$_l_StringPosition:=Position:C15("Resources"; $_t_ResourcesPath)
		
		$_t_WebFolderParent:=Substring:C12($_t_ResourcesPath; 1; $_l_StringPosition-1)
		$_t_PathtoDocInternal:=$_t_WebFolderParent+"WebFolder:Internal_path:"
		$_t_PathtoDocInternal:=$_t_PathtoDocInternal+$2+"."+$_t_DocumentNameExtension
		//if new Html is generetated for a template the new styles lic in the sourcefiles
		If (Not:C34(Is a document:K24:1=Test path name:C476($_t_PathtoDocInternal)))
			
			$_t_WebStyle:=DBWS_GetPreferences
			$_t_WebStyle:=Replace string:C233($_t_WebStyle; "Home_"; "_")
			
			$_t_PathtoWebStyleDocument:=$_t_WebFolderParent+"WebFolder:SourceFiles:"
			$_t_PathtoWebStyleDocument:=$_t_PathtoWebStyleDocument+$2+$_t_WebStyle+"."+$_t_DocumentNameExtension
			If ((Is a document:K24:1=Test path name:C476($_t_PathtoWebStyleDocument)))
				COPY DOCUMENT:C541($_t_PathtoWebStyleDocument; $_t_PathtoDocInternal)
			Else 
				$_t_PathtoWebStyleDocument:=$_t_PathtoWebStyleDocument+$2+"."+$_t_DocumentNameExtension
				If ((Is a document:K24:1=Test path name:C476($_t_PathtoWebStyleDocument)))
					$_t_PathtoWebStyleDocument:=$_t_PathtoWebStyleDocument+$2+"."+$_t_DocumentNameExtension
				End if 
			End if 
		End if 
		//Note if the templates are updated all the docs at he webfolder path must get deleted
		If ((Is a document:K24:1=Test path name:C476($_t_PathtoDocInternal)))
			WEB SEND FILE:C619("Internal_path/"+$2+"."+$_t_DocumentNameExtension)
		End if 
End case 


QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[xDiaryRelations:137]xDiaryID:1)
ERR_MethodTrackerReturn("DBWS_SetPage"; $_t_oldMethodName)