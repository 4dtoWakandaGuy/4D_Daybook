If (False:C215)
	//Table Form Method Name: [USER]HLP_Edit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_ContextsDocument; Folder separator:K24:12; $_t_LocalCachePath; $_t_oldMethodName; $_t_PlugInPath; $_t_SpecialFormDocReference; $_t_StandardFormDocReference; $_t_StructurePath; HLP_t_DaybookHelpRef; HLP_T_EditHelpReference; HLP_T_IntranetkHelpRef)
	C_TEXT:C284(HLP_t_DocumentsPath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].HLP_Edit"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (HLP_T_EditHelpReference#"")
			//Folder separator:=DB_DirSymbol 
			Case of 
				: (Application type:C494<4)  // single user
					$_t_StructurePath:=Structure file:C489
					$_t_StructurePath:=PathFromPathName($_t_StructurePath)
					$_t_PlugInPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
					$_t_ContextsDocument:=$_t_PlugInPath+"CONTEXTS"+".xml"
					If (Test path name:C476($_t_ContextsDocument)=Is a document:K24:1)
					Else 
						$_t_ContextsDocument:="'"
					End if 
				Else 
					//client(cant access this on server)
					$_t_LocalCachePath:=Get 4D folder:C485(4D Client database folder:K5:13)
					
					
					$_t_PlugInPath:=$_t_LocalCachePath+"PlugIns"+Folder separator:K24:12  //Directory_Symbol
					$_t_ContextsDocument:=$_t_PlugInPath+"CONTEXTS"+".xml"
			End case 
			HLP_t_DocumentsPath:=$_t_ContextsDocument
			$_t_StandardFormDocReference:=HLP_GetContextReference($_t_ContextsDocument; HLP_T_EditHelpReference; "DEFAULT")
			$_t_StandardFormDocReference:=Replace string:C233($_t_StandardFormDocReference; "docs.daybook.co.uk/"; "")
			If ($_t_StandardFormDocReference="TOC")
				$_t_StandardFormDocReference:=""
			End if 
			$_t_SpecialFormDocReference:=HLP_GetContextReference($_t_ContextsDocument; HLP_T_EditHelpReference; "ALTERNATIVE")
			If ($_t_SpecialFormDocReference="TOC")
				$_t_SpecialFormDocReference:=""
			End if 
			If ($_t_StandardFormDocReference#"")
				If ($_t_StandardFormDocReference=$_t_SpecialFormDocReference)
					//this is because the standard call returns the standard value if a special one is not set
					$_t_SpecialFormDocReference:=""
				End if 
			End if 
			
			HLP_t_DaybookHelpRef:=$_t_StandardFormDocReference
			HLP_T_IntranetkHelpRef:=$_t_SpecialFormDocReference
			If (Not:C34(User in group:C338(Current user:C182; "Designer")))
				
				OBJECT SET ENTERABLE:C238(HLP_t_DaybookHelpRef; False:C215)
			End if 
			If (Not:C34(User in group:C338(Current user:C182; "Administrator"))) & (Not:C34(User in group:C338(Current user:C182; "Designer")))
				OBJECT SET ENTERABLE:C238(HLP_T_IntranetkHelpRef; False:C215)
			End if 
			WS_AutoscreenSize(2; 110; 450)
		Else 
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("FM [USER].HLP_Edit"; $_t_oldMethodName)
