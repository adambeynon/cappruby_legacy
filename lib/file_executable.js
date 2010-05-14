ObjectiveJ.FileExecutable = function FileExecutable(/*CFURL|String*/ aURL)
{
    with (ObjectiveJ) {
    // throw "a"
    console.log(aURL);
    aURL = makeAbsoluteURL(aURL);

    var URLString = aURL.absoluteString(),
        existingFileExecutable = FileExecutablesForURLStrings[URLString];

    if (existingFileExecutable)
        return existingFileExecutable;

    FileExecutablesForURLStrings[URLString] = this;

    var fileContents = StaticResource.resourceAtURL(aURL).contents(),
        executable = NULL,
        extension = aURL.pathExtension();

    if (fileContents.match(/^@STATIC;/))
        executable = decompile(fileContents, aURL);

    else if (extension === "j" || !extension)
        executable = exports.preprocess(fileContents, aURL, Preprocessor.Flags.IncludeDebugSymbols);
    
    else if (extension === "rb") {
        alert('doing this');
    //     // need to monkey path here to use cappruby loader
    //     // executable = new Executable(new CappRuby.Parser(fileContents, aURL).parse(), [], aURL)
    //     executable = new Executable(new CappRuby.Parser(fileContents, aURL).parse(), [], aURL);
    //     alert("doing this init!");
     }   
    else
        executable = new Executable(fileContents, [], aURL);

    Executable.apply(this, [executable.code(), executable.fileDependencies(), aURL, executable._function]);

    this._hasExecuted = NO;
}
}