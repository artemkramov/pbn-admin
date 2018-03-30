<?php

use common\models\Lang;

?>
<label><?= $title ?></label>
<div class="tab-content">
    <? foreach ($languages as $language): ?>
        <? $tab = $language->url . $field; ?>
        <div role="tabpanel"
             class="tab-pane <? if ($language->url == Lang::getCurrent()->url) echo 'active' ?>"
             id="<?= $tab ?>">
            <?
            $fieldData = $form->field($model, \common\models\Bean::getMultiAttributeName($field, $language->url))->label(false);
            foreach ($parameters as $function => $options) {
                $fieldData = $fieldData->{$function}($options);
            }
            echo $fieldData;
            ?>
        </div>
    <? endforeach; ?>
</div>