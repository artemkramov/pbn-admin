<?

/**
 * @var string $title
 * @var boolean $enableAddOption
 * @var string $attribute
 * @var string $templateReplaceKeyword
 * @var array $dataItems
 * @var string $template
 */

?>

<div class="form-group block-multiple-items">
    <div>
        <label><?= $title ?></label>
    </div>
    <? if ($enableAddOption): ?>
        <div class="btn btn btn-default btn-add-bean" data-attr="<?= $attribute ?>">
            <i class="glyphicon glyphicon-plus"></i>
        </div>
    <? endif; ?>
    <div class="sortable" data-container="<?= $attribute ?>" style="margin-top: 15px">
        <? foreach ($dataItems as $item): ?>
            <? echo $item; ?>
        <? endforeach; ?>
    </div>
    <div class="hidden template-bean" data-template="<?= $attribute ?>">
        <? echo $template; ?>
    </div>
</div>
<script>
    var templateReplaceKeyword = '<?=$templateReplaceKeyword?>';
</script>