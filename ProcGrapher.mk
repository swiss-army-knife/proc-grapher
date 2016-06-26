##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=ProcGrapher
ConfigurationName      :=Debug
WorkspacePath          := "/home/nihalsid/Documents/CPPSpace"
ProjectPath            := "/home/nihalsid/Documents/CPPSpace/ProcGrapher"
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=BigDataUbuntu
Date                   :=26/06/16
CodeLitePath           :="/home/nihalsid/.codelite"
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="ProcGrapher.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)/usr/local/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)boost_system $(LibrarySwitch)boost_filesystem $(LibrarySwitch)boost_program_options $(LibrarySwitch)boost_iostreams 
ArLibs                 :=  "libboost_system.a" "libboost_filesystem.a" "libboost_program_options.a" "libboost_iostreams.a" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)libs 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -g -O0 -Wall -std=c++11 $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/source_main.cpp$(ObjectSuffix) $(IntermediateDirectory)/source_ProcInterface.cpp$(ObjectSuffix) $(IntermediateDirectory)/source_PrintUtils.cpp$(ObjectSuffix) $(IntermediateDirectory)/source_ProcInfo.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/source_main.cpp$(ObjectSuffix): source/main.cpp $(IntermediateDirectory)/source_main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/nihalsid/Documents/CPPSpace/ProcGrapher/source/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/source_main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/source_main.cpp$(DependSuffix): source/main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/source_main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/source_main.cpp$(DependSuffix) -MM "source/main.cpp"

$(IntermediateDirectory)/source_main.cpp$(PreprocessSuffix): source/main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/source_main.cpp$(PreprocessSuffix) "source/main.cpp"

$(IntermediateDirectory)/source_ProcInterface.cpp$(ObjectSuffix): source/ProcInterface.cpp $(IntermediateDirectory)/source_ProcInterface.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/nihalsid/Documents/CPPSpace/ProcGrapher/source/ProcInterface.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/source_ProcInterface.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/source_ProcInterface.cpp$(DependSuffix): source/ProcInterface.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/source_ProcInterface.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/source_ProcInterface.cpp$(DependSuffix) -MM "source/ProcInterface.cpp"

$(IntermediateDirectory)/source_ProcInterface.cpp$(PreprocessSuffix): source/ProcInterface.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/source_ProcInterface.cpp$(PreprocessSuffix) "source/ProcInterface.cpp"

$(IntermediateDirectory)/source_PrintUtils.cpp$(ObjectSuffix): source/PrintUtils.cpp $(IntermediateDirectory)/source_PrintUtils.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/nihalsid/Documents/CPPSpace/ProcGrapher/source/PrintUtils.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/source_PrintUtils.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/source_PrintUtils.cpp$(DependSuffix): source/PrintUtils.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/source_PrintUtils.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/source_PrintUtils.cpp$(DependSuffix) -MM "source/PrintUtils.cpp"

$(IntermediateDirectory)/source_PrintUtils.cpp$(PreprocessSuffix): source/PrintUtils.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/source_PrintUtils.cpp$(PreprocessSuffix) "source/PrintUtils.cpp"

$(IntermediateDirectory)/source_ProcInfo.cpp$(ObjectSuffix): source/ProcInfo.cpp $(IntermediateDirectory)/source_ProcInfo.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/nihalsid/Documents/CPPSpace/ProcGrapher/source/ProcInfo.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/source_ProcInfo.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/source_ProcInfo.cpp$(DependSuffix): source/ProcInfo.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/source_ProcInfo.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/source_ProcInfo.cpp$(DependSuffix) -MM "source/ProcInfo.cpp"

$(IntermediateDirectory)/source_ProcInfo.cpp$(PreprocessSuffix): source/ProcInfo.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/source_ProcInfo.cpp$(PreprocessSuffix) "source/ProcInfo.cpp"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


