package options;

class EngineSettingsSubState extends BaseOptionsMenu
{
    public function new()
    {
        title = 'Engine Settings';
        rpcTitle = 'Engine Settings Menu';

        var watermarkOption:Option = new Option(
            'Show Engine Watermark',
            'If checked, displays the Rhyps Engine watermark during songs.',
            'showEngineWatermark',
            'bool'
        );

        addOption(watermarkOption);

        super();
    }
}
