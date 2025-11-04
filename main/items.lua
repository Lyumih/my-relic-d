-- Таблица с данными https://docs.google.com/spreadsheets/d/1-UzCsKyCI_K9sKxfGBhHPL-7qnAWLRxYmTxLEFJs5K8/edit?usp=sharing
local M = {}

-- Имена предметов
M.item = {
	"Меч",
	"Катана",
	"Пика",
	"Алебарда",
	"Копьё",
	"Лук",
	"Пистолет",
	"Мушкет",
	"Дротик",
	"Пушка"
}

-- Локализация типов данных
M.typeNames = {
	props = 'Влияние',
	item = 'Предмет',
	rarity = 'Редкость',
	prefix = 'Префикс'
}

-- Значения предмета на предметов. Меч ~ Катана = 4. Своё значение можно узнать, в идентификаторе таблицы нажав на себя.

-- Имена свойств (влияний)
M.props = {
	"Атака",
	"Здоровье",
	"Защита",
	"Вампиризм",
	"Крит. удар",
	"Крит. шанс",
	"Уклонение",
	"Скорость",
	"Шанс оглушения",
	"Отражение"
}

-- Значение предметов на свойства (влияния). Меч ~ Атака = 5
-- items.propsValues[self.props[i]][self.item]
M.propsValues = {
	{ 5, 5, 4, 4, 4, 6, 8, 6, 3,  10 },
	{ 6, 4, 4, 4, 5, 3, 4, 4, 2,  6 },
	{ 7, 5, 8, 8, 8, 3, 3, 4, 1,  3 },
	{ 5, 5, 5, 4, 4, 2, 0, 1, 0,  1 },
	{ 4, 6, 3, 3, 6, 7, 7, 5, 10, 7 },
	{ 5, 6, 4, 4, 7, 7, 7, 5, 8,  4 },
	{ 5, 8, 5, 5, 6, 3, 5, 4, 7,  2 },
	{ 6, 8, 4, 4, 6, 7, 8, 5, 9,  3 },
	{ 4, 3, 3, 6, 5, 6, 3, 6, 3,  7 },
	{ 6, 8, 4, 5, 4, 2, 2, 6, 1,  2 },
}

-- Имена редкости
M.rarity = {
	"Хлам",
	"Бедный",
	"Обычный",
	"Необычный",
	"Редкий",
	"Мифический",
	"Легендарный",
	"Древний",
	"Уникальный",
	"Божественный"
}

-- Имена префиксов
M.prefix = {
	"Обычный",
	"Кленовый",
	"Красивый",
	"Жестокий",
	"Острый",
	"Безупречный",
	"Ржавый",
	"Треснутый",
	"Королевский",
	"Богатый"
}

-- Значение префиксов на свойства (влияние). Кровавый ~ Атака = 3
-- items.prefixPropsValues[self.props[i]][self.prefix]
M.prefixPropsValues = {
	{ 0, 1, 0, 3,  3, 4, -2, -1, 1,  0 },
	{ 0, 2, 0, -1, 0, 1, 0,  0,  0,  1 },
	{ 0, 2, 1, 1,  1, 2, 0,  -1, 2,  2 },
	{ 0, 0, 0, 3,  3, 2, 1,  1,  2,  0 },
	{ 0, 2, 0, 2,  3, 3, -1, -1, 2,  2 },
	{ 0, 2, 0, 2,  2, 3, -1, -1, 2,  0 },
	{ 0, 1, 2, 0,  0, 1, 1,  1,  1,  4 },
	{ 0, 1, 0, 1,  0, 2, 2,  2,  -1, -1 },
	{ 0, 2, 1, 2,  0, 1, 3,  2,  0,  0 },
	{ 0, 0, 3, 1,  0, 1, 4,  4,  1,  3 },
}

-- Тестовая строка для проверки модуля
M.test = 'items.lua'

-- Возвращает значение свойства в пересчёте на префикс.
M.getPropPrefixValue = function(self, propIndex)
	return M.propsValues[self.props[propIndex]][self.item] + M.prefixPropsValues[self.props[propIndex]][self.prefix]
end

-- не используется?
M.calcPropsValues = function(self)
	local propsValues = 0
	for i = 1, #self.props do
		propsValues = propsValues + M.propsValues[self.props[i]][self.item] +
			(self.qualityProps and self.qualityProps[i] or 0)
	end
	return propsValues
end

-- Возвращает суммарное значение свойств в пересчёте на префикс и качество свойств
M.calcPropsPrefixValues = function(self)
	local propsValues = 0
	for i = 1, #self.props do
		local qualityProps = self.qualityProps and self.qualityProps[i]
		propsValues = propsValues + M.propsValues[self.props[i]][self.item] +
			M.prefixPropsValues[self.props[i]][self.prefix] + qualityProps
	end
	return propsValues
end

-- Возвращает суммарное значение свойств с пересчётам на редкость
M.calcPoints = function(self)
	return M.calcPropsPrefixValues(self) * (1 + self.rarity / 10)
end

return M
