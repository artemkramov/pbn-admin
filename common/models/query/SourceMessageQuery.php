<?php

/**
 * Created by PhpStorm.
 * User: artem
 * Date: 5/16/16
 * Time: 1:49 PM
 */

namespace common\models\query;

use yii\db\ActiveQuery;
use Yii;
use common\models\Message;

class SourceMessageQuery extends ActiveQuery
{
    public function notTranslated()
    {
        $messageTableName = Message::tableName();
        $query = Message::find()->select($messageTableName . '.id');
        $i = 0;
        foreach (Yii::$app->getI18n()->languages as $language) {
            if ($i === 0) {
                $query->andWhere($messageTableName . '.language = :language and ' . $messageTableName . '.translation is not null', [':language' => $language]);
            } else {
                $query->innerJoin($messageTableName . ' t' . $i, 't' . $i . '.id = ' . $messageTableName . '.id and t' . $i . '.language = :language and t' . $i . '.translation is not null', [':language' => $language]);
            }
            $i++;
        }
        $ids = $query->indexBy('id')->all();
        $this->andWhere(['not in', 'id', array_keys($ids)]);
        return $this;
    }

    public function translated()
    {
        $messageTableName = Message::tableName();
        $query = Message::find()->select($messageTableName . '.id');
        $i = 0;
        foreach (Yii::$app->getI18n()->languages as $language) {
            if ($i === 0) {
                $query->andWhere($messageTableName . '.language = :language and ' . $messageTableName . '.translation is not null', [':language' => $language]);
            } else {
                $query->innerJoin($messageTableName . ' t' . $i, 't' . $i . '.id = ' . $messageTableName . '.id and t' . $i . '.language = :language and t' . $i . '.translation is not null', [':language' => $language]);
            }
            $i++;
        }
        $ids = $query->indexBy('id')->all();
        $this->andWhere(['in', 'id', array_keys($ids)]);
        return $this;
    }
}